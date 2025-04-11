// copy this file to modules/graceful/net_anon.go before building gitea
package graceful

import (
	"fmt"
	"net"
	"net/http"
	"os"

	"github.com/go-i2p/go-meta-listener/mirror"
)

// This implements the GetListener function for TLS, I2P, and Onion. Note the exemption for Unix sockets.
func MultiGetListener(network, address string) (net.Listener, error) {
	EMAIL := os.Getenv("EMAIL")
	if EMAIL == "" {
		return nil, fmt.Errorf("EMAIL environment variable not set, TLS not possible")
	}
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
		return mirror.Listen(address, EMAIL, "./certs", true)
	}
}

// We use `init() to ensure that the appropriate Listeners and Dialers are correctly placed at runtime
func init() {
	GetListener = MultiGetListener
	httpClient := &http.Client{
		Transport: &http.Transport{
			Dial: Dial,
		},
	}

	http.DefaultClient = httpClient
	http.DefaultTransport = httpClient.Transport
}
