# go-gitlooseleaf
A soft-fork of gitea with support for running as a multi-protocol service. Just the mod and the CI files.

How it works:
=============

This uses GitHub CI to continuously build a version of Gitea that can simultaneously run as a regular TLS service, an I2P service, and a Tor onion service, based on the latest release of Gitea.
We can do this without requiring a patch to the Gitea source code.
This is because Gitea encapsulates its "Listening" and "Dialing" into functions, which can easily be substituted for alternative versions.
For instance, the network listener is set up by a function, `graceful.GetListener() (net.Listener, error)` in the file `modules/graceful/server.go`. 
The default implementation of the `GetListener() (net.Listener, error)` function, `DefaultGetListener() (net.Listener, error)` is defined in the `modules/graceful/net_unix.go` for Unix-like systems and `modules/graceful/net_windows.go` for Windows-like systems.
A developer who wishes to "Mod" gitea to listen on another kind of connection do so by creating a new file which implements a `GetListener() (net.Listener, error)` function using alternate listener implementations.

On the client side, the same thing is possible because Go allows you to substitute the underlying transports used for the default HTTP Client.
So, in the absence of overriding settings, we can configure it to use TLS, SAMv3 (for I2P), and the Tor SOCKS proxy to build HTTP connections using the appropriate transport for each service.

Finally, if you need to include additional libraries, run `go mod tidy` in the root of the gitea checkout to include them.

Here is a complete working example mod:

```Go
// copy this file to modules/graceful/net_multi.go before building gitea
package graceful

import (
	"net"
	"net/http"

	"github.com/go-i2p/onramp"
	"github.com/cretz/bine/tor"
)

// Set up the I2P Garlic API
var garlic, i2perr = onramp.NewGarlic("gitea-i2p", "127.0.0.1:7656", onramp.OPT_DEFAULTS)

// Set up the Tor onion service
var torInstance, torerr = tor.Start(nil, nil)
var onion, onionerr = torInstance.Listen(nil, 80)

// This implements the GetListener function for I2P. Note the exemption for Unix sockets.
func MultiGetListener(network, address string) (net.Listener, error) {
	// Add a deferral to say that we've tried to grab a listener
	defer GetManager().InformCleanup()
	switch network {
	case "unix", "unixpacket":
		// I2P isn't really a replacement for the stuff you use Unix sockets for and it's also not an anonymity risk, so treat them normally
		unixAddr, err := ResolveUnixAddr(network, address)
		if err != nil {
			return nil, err
		}
		return GetListenerUnixWrapper(network, unixAddr)
	default:
		return mirror.Listen("tcp", address, "./certs", true)
	}
}

// We use `init() to ensure that the appropriate Listeners and Dialers are correctly placed at runtime
func init() {
	GetListener = MultiGetListener
	/*Dialer not shown here*/
}

```

Caveats
-------

Gitea makes a few other kinds of connections, besides `HTTP`, if instructed to do so in the config file.
For instance, there is an SMTP client.
Not all of these connections are automatically routed through the appropriate anonymity networks in this configuration.
For I2P, you might need to use `127.0.0.1:7659/7660` for SMTP. For Tor, you would configure SOCKS proxy settings.
Similarly, SSH client connections need additional configuration to properly route through these networks.
Additional adjustments to the configuration can be made to also route these services across the appropriate networks but aren't fully documented here at this time.

License
-------

Both this mod and gitea are licensed under the MIT license.
See LICENSE for net_multi*.go in this repository.
LICENSE-gitea.md is a copy of the Gitea license from https://github.com/go-gitea/gitea
