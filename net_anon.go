// copy this file to modules/graceful/net_anon.go before building gitea
package graceful

import (
	"net"

	"github.com/go-i2p/go-meta-listener/mirror"
)

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

// We use `init() to ensure that the I2P Listeners and Dialers are correctly placed at runtime`
func init() {
	GetListener = MultiGetListener
	/*httpClient := &http.Client{
		Transport: &http.Transport{
			Dial: garlic.Dial,
		},
	}

	http.DefaultClient = httpClient
	http.DefaultTransport = httpClient.Transport*/
}
