// copy this file to modules/graceful/net_anon.go before building gitea
package graceful

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
	"path/filepath"

	"github.com/go-i2p/go-meta-listener/mirror"

	"code.gitea.io/gitea/modules/setting"
	limitedlistener "github.com/go-i2p/go-limit"
)

func hostname() string {
	hostname := os.Getenv("HOSTNAME")
	if hostname == "" {
		// get the local hostname
		// this is a fallback for when the HOSTNAME environment variable is not set
		hostname, err := os.Hostname()
		if err != nil {
			log.Printf("Warning: %s", err)
		}
		if hostname == "" {
			// this is a fallback for when the hostname is not set
			hostname = "localhost"
		}
	}
	return hostname
}

var mirrorListener, mirrorErr = mirror.NewMirror(hostname())

// This implements the GetListener function for TLS, I2P, and Onion. Note the exemption for Unix sockets.
func MultiGetListener(network, address string) (net.Listener, error) {
	if mirrorErr != nil {
		return nil, mirrorErr
	}
	EMAIL := os.Getenv("EMAIL")
	if EMAIL == "" {
		log.Printf("Warning: %s", fmt.Errorf("EMAIL environment variable not set, TLS not possible"))
	} else {
		log.Printf("Using %s as email for TLS", EMAIL)
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
		ml, err := mirrorListener.Listen(address, EMAIL)
		mirror.CERT_DIR = filepath.Join(setting.CustomPath, "certs")
		mirror.HIDDEN_TLS = true
		if err != nil {
			return nil, err
		}
		return limitedlistener.NewLimitedListener(ml,
			limitedlistener.WithMaxConnections(500), // max concurrent
			limitedlistener.WithRateLimit(24),       // per second
		), nil
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
