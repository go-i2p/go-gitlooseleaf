package graceful

import (
	"net"

	metadialer "github.com/go-i2p/go-meta-dialer"
)

func Dial(network, addr string) (net.Conn, error) {
	return metadialer.Dial(network, addr)
}
