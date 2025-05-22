Project Path: /home/idk/go/src/github.com/go-i2p/go-gitlooseleaf

Source Tree:

```
go-gitlooseleaf
├── go.sum
├── net_mirror.go
├── net_mirror_dialer.go
├── go.mod
├── LICENSE
├── postinst
├── download.sh
├── net_mirror_unix.go
├── env.sh
├── etc
│   └── systemd
│       └── system
│           ├── gitea.service
│           └── gitea.service.d
│               └── user-config.conf
├── package-lock.json
├── preinst
├── README.md
├── Makefile
├── net_mirror_windows.go
├── install.sh
└── LICENSE-gitea.md

```

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/go.sum`:

```````sum
github.com/cretz/bine v0.2.0 h1:8GiDRGlTgz+o8H9DSnsl+5MeBK4HsExxgl6WgzOCuZo=
github.com/cretz/bine v0.2.0/go.mod h1:WU4o9QR9wWp8AVKtTM1XD5vUHkEqnf2vVSo6dBqbetI=
github.com/davecgh/go-spew v1.1.0/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38=
github.com/davecgh/go-spew v1.1.1/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38=
github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc h1:U9qPSI2PIWSS1VwoXQT9A3Wy9MM3WgvqSxFWenqJduM=
github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38=
github.com/go-i2p/go-limit v0.0.0-20250203203118-210616857c15 h1:ASjMbwlepoDQfrhv+H2B5ICBPJU5ES1JzmOxzPDx3YQ=
github.com/go-i2p/go-limit v0.0.0-20250203203118-210616857c15/go.mod h1:4jjmVRhvKj47sQ6B6wdDhN1IrEZunE6KwkYLQx/BeVE=
github.com/go-i2p/go-meta-dialer v0.0.0-20250501024057-715e91be3cfe h1:9Rxw2KtMCRKZHI4WavUAaatzKmc64V6kiYvcyTMHjeU=
github.com/go-i2p/go-meta-dialer v0.0.0-20250501024057-715e91be3cfe/go.mod h1:++xHSOvnGymRSyFbi9A9hztcfwKfU6/nJAtVxrNo8Zo=
github.com/go-i2p/go-meta-listener v0.0.5-0.20250521170131-2058a4309616 h1:EDx3FrzeGSjtYiH6GAF/lKNseNVDDHqR2OY/hQfiOqo=
github.com/go-i2p/go-meta-listener v0.0.5-0.20250521170131-2058a4309616/go.mod h1:wF/MCCfB40gZyT9WtuYWQkUOPrnoTzA+NG0zpsy3s4M=
github.com/go-i2p/i2pkeys v0.0.0-20241108200332-e4f5ccdff8c4/go.mod h1:m5TlHjPZrU5KbTd7Lr+I2rljyC6aJ88HdkeMQXV0U0E=
github.com/go-i2p/i2pkeys v0.33.92 h1:e2vx3vf7tNesaJ8HmAlGPOcfiGM86jzeIGxh27I9J2Y=
github.com/go-i2p/i2pkeys v0.33.92/go.mod h1:BRURQ/twxV0WKjZlFSKki93ivBi+MirZPWudfwTzMpE=
github.com/go-i2p/onramp v0.33.92 h1:Dk3A0SGpdEw829rSjW2LqN8o16pUvuhiN0vn36z7Gpc=
github.com/go-i2p/onramp v0.33.92/go.mod h1:5sfB8H2xk05gAS2K7XAUZ7ekOfwGJu3tWF0fqdXzJG4=
github.com/go-i2p/sam3 v0.33.92 h1:TVpi4GH7Yc7nZBiE1QxLjcZfnC4fI/80zxQz1Rk36BA=
github.com/go-i2p/sam3 v0.33.92/go.mod h1:oDuV145l5XWKKafeE4igJHTDpPwA0Yloz9nyKKh92eo=
github.com/opd-ai/wileedot v0.0.0-20241217172720-521d4175e624 h1:FXCTQV93+31Yj46zpYbd41es+EYgT7qi4RK6KSVrGQM=
github.com/opd-ai/wileedot v0.0.0-20241217172720-521d4175e624/go.mod h1:ftKSvvGC9FnxZeuL3B4MB6q/DOzVSV0kET08YUyDwbM=
github.com/pkg/errors v0.9.1 h1:FEBLx1zS214owpjy7qsBeixbURkuhQAwrK5UwLGTwt4=
github.com/pkg/errors v0.9.1/go.mod h1:bwawxfHBFNV+L2hUp1rHADufV3IMtnDRdf1r5NINEl0=
github.com/pmezard/go-difflib v1.0.0/go.mod h1:iKH77koFhYxTK1pcRnkKkqfTogsbg7gZNVY4sRDYZ/4=
github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 h1:Jamvg5psRIccs7FGNTlIRMkT8wgtp5eCXdBlqhYGL6U=
github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2/go.mod h1:iKH77koFhYxTK1pcRnkKkqfTogsbg7gZNVY4sRDYZ/4=
github.com/sirupsen/logrus v1.9.3 h1:dueUQJ1C2q9oE3F7wvmSGAaVtTmUizReu6fjN8uqzbQ=
github.com/sirupsen/logrus v1.9.3/go.mod h1:naHLuLoDiP4jHNo9R0sCBMtWGeIprob74mVsIT4qYEQ=
github.com/stretchr/objx v0.1.0/go.mod h1:HFkY916IF+rwdDfMAkV7OtwuqBVzrE8GR6GFx+wExME=
github.com/stretchr/testify v1.7.0/go.mod h1:6Fq8oRcR53rry900zMqJjRRixrwX3KX962/h/Wwjteg=
github.com/stretchr/testify v1.10.0 h1:Xv5erBjTwe/5IxqUQTdXv5kgmIvbHo3QQyRwhJsOfJA=
github.com/stretchr/testify v1.10.0/go.mod h1:r2ic/lqez/lEtzL7wO/rwa5dbSLXVDPFyf8C91i36aY=
golang.org/x/crypto v0.0.0-20210513164829-c07d793c2f9a/go.mod h1:P+XmwS30IXTQdn5tA2iutPOUgjI07+tq3H3K9MVA1s8=
golang.org/x/crypto v0.38.0 h1:jt+WWG8IZlBnVbomuhg2Mdq0+BBQaHbtqHEFEigjUV8=
golang.org/x/crypto v0.38.0/go.mod h1:MvrbAqul58NNYPKnOra203SB9vpuZW0e+RRZV+Ggqjw=
golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod h1:m0MpNAwzfU5UDzcl9v0D8zg8gWTRqZa9RBIspLL5mdg=
golang.org/x/net v0.0.0-20210525063256-abc453219eb5/go.mod h1:9nx3DQGgdP8bBQD5qxJ1jj9UTztislL4KSBs9R2vV5Y=
golang.org/x/net v0.40.0 h1:79Xs7wF06Gbdcg4kdCCIQArK11Z1hr5POQ6+fIYHNuY=
golang.org/x/net v0.40.0/go.mod h1:y0hY0exeL2Pku80/zKK7tpntoX23cqL3Oa6njdgRtds=
golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
golang.org/x/sys v0.27.0/go.mod h1:/VUhepiaJMQUp4+oa/7Zr1D23ma6VTLIYjOOTFZPUcA=
golang.org/x/sys v0.33.0 h1:q3i8TbbEz+JRD9ywIRlyRAQbM0qF7hu24q3teo2hbuw=
golang.org/x/sys v0.33.0/go.mod h1:BJP2sWEmIv4KK5OTEluFJCKSidICx8ciO85XgH3Ak8k=
golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod h1:bj7SfCRtBDWHUb9snDiAeCFNEtKQo2Wmx5Cou7ajbmo=
golang.org/x/text v0.3.3/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
golang.org/x/text v0.3.6/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
golang.org/x/text v0.25.0 h1:qVyWApTSYLk/drJRO5mDlNYskwQznZmkpV2c8q9zls4=
golang.org/x/text v0.25.0/go.mod h1:WEdwpYrmk1qmdHvhkSTNPm3app7v4rsT8F2UD6+VHIA=
golang.org/x/time v0.11.0 h1:/bpjEDfN9tkoN/ryeYHnv5hcMlc8ncjMcM4XBk5NWV0=
golang.org/x/time v0.11.0/go.mod h1:CDIdPxbZBQxdj6cxyCIdrNogrJKMJ7pr37NYpMcMDSg=
golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ=
gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0=
gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod h1:K4uyk7z7BCEPqu6E+C64Yfv1cQ7kz7rIZviUmN+EgEM=
gopkg.in/yaml.v3 v3.0.1 h1:fxVm/GzAzEWqLHuvctI91KS9hhNmmWOoWu0XTYJS7CA=
gopkg.in/yaml.v3 v3.0.1/go.mod h1:K4uyk7z7BCEPqu6E+C64Yfv1cQ7kz7rIZviUmN+EgEM=

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/net_mirror.go`:

```````go
// copy this file to modules/graceful/net_anon.go before building gitea
package graceful

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"os"

	"github.com/go-i2p/go-meta-listener/mirror"

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
		ml, err := mirrorListener.Listen(address, EMAIL, "./certs", true)
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

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/net_mirror_dialer.go`:

```````go
package graceful

import (
	"net"

	metadialer "github.com/go-i2p/go-meta-dialer"
)

func Dial(network, addr string) (net.Conn, error) {
	if metadialer.ANON {
		metadialer.ANON = false
	}
	return metadialer.Dial(network, addr)
}

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/go.mod`:

```````mod

require (
	github.com/go-i2p/go-limit v0.0.0-20250203203118-210616857c15
	github.com/go-i2p/go-meta-dialer v0.0.0-20250501024057-715e91be3cfe
	github.com/go-i2p/go-meta-listener v0.0.5
)

require (
	github.com/cretz/bine v0.2.0 // indirect
	github.com/go-i2p/i2pkeys v0.33.92 // indirect
	github.com/go-i2p/onramp v0.33.92 // indirect
	github.com/go-i2p/sam3 v0.33.92 // indirect
	github.com/opd-ai/wileedot v0.0.0-20241217172720-521d4175e624 // indirect
)

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/LICENSE`:

```````
MIT License

Copyright (c) 2025 I2P For Go

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/postinst`:

```````
# only if we're root

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

BINARY_PATH=${BASE}/usr/local/bin/gitea
SYSTEMD_PATH=${BASE}/etc/systemd/system
CONFIG_PATH=${BASE}/etc/gitea
DATA_PATH=${BASE}/var/lib/gitea

echo chown -R git:git "$DATA_PATH/"
echo chmod -R 750 "$DATA_PATH/"
echo chown root:git "$CONFIG_PATH"
echo chmod 770 "$CONFIG_PATH"
```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/download.sh`:

```````sh
#!/bin/bash

# Set GitHub repo info
OWNER="go-i2p"
REPO="go-gittisane"

echo "Fetching latest release info from GitHub..."

# Get latest release data
RELEASE_DATA=$(curl -s "https://api.github.com/repos/$OWNER/$REPO/releases/latest")

# Extract version number
VERSION=$(echo "$RELEASE_DATA" | grep -Po '"tag_name": "\K.*?(?=")')
echo "Latest version: $VERSION"

# Create downloads directory
mkdir -p downloads
cd downloads

# Download each asset
echo "$RELEASE_DATA" | grep -Po '"browser_download_url": "\K.*?(?=")' | while read -r url; do
    filename=$(basename "$url")
    echo "Downloading $filename..."
    curl -L -o "$filename" "$url"
    
    # Make Linux/macOS binaries executable
    if [[ "$filename" != *".exe" ]]; then
        chmod +x "$filename"
    fi
done

echo "Download complete! Files are in the 'downloads' directory"
```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/net_mirror_unix.go`:

```````go
// Copyright 2019 The Gitea Authors. All rights reserved.
// SPDX-License-Identifier: MIT

// This code is heavily inspired by the archived gofacebook/gracenet/net.go handler

//go:build !windows

package graceful

import (
	"fmt"
	"net"
)

func ResolveUnixAddr(network, address string) (net.Addr, error) {
	switch network {
	case "unix", "unixpacket":
		return net.ResolveUnixAddr(network, address)
	default:
		return nil, fmt.Errorf("unknown network type %s", network)
	}
}

func GetListenerUnixWrapper(network string, addr net.Addr) (net.Listener, error) {
	switch addr.(type) {
	case *net.UnixAddr:
		return GetListenerUnix(network, addr.(*net.UnixAddr))
	default:
		return nil, fmt.Errorf("unknown address type %T", addr)
	}
}

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/env.sh`:

```````sh
#! /usr/bin/env bash
cd downloads
export HOSTNAME=localhost
export GITEA_WORK_DIR=$(pwd)
export GITEA_CUSTOM="$GITEA_WORK_DIR/custom"
./gitea web --config app.ini
```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/etc/systemd/system/gitea.service`:

```````service
[Unit]
Description=Gitea (Modified with multi-protocol TLS/I2P/Tor support)
Documentation=https://github.com/go-i2p/go-gitlooseleaf
After=network.target postgresql.service mysql.service mariadb.service
Wants=network.target

[Service]
Type=simple
User=git
Group=git
WorkingDirectory=/home/git
ExecStart=/usr/local/bin/gitea web --config /etc/gitea/app.ini
Restart=always
RestartSec=10
Environment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea

# Hardening measures
ProtectSystem=full
PrivateTmp=true
PrivateDevices=true
NoNewPrivileges=true
ReadWritePaths=/var/lib/gitea /etc/gitea /home/git
AmbientCapabilities=CAP_NET_BIND_SERVICE

# Load user-modifiable configuration from drop-in directory
# This will automatically include all .conf files in gitea.service.d/

[Install]
WantedBy=multi-user.target
```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/etc/systemd/system/gitea.service.d/user-config.conf`:

```````conf
[Service]
# User-configurable environment variables for multi-protocol support

# Required for TLS certificate generation - CHANGE THIS!
Environment="EMAIL=your-email@example.com"

# Optional: Set explicit hostname (defaults to system hostname if not set)
# Environment="HOSTNAME=your-hostname"

# Optional: Performance tuning
# Environment="MAX_CONNECTIONS=500"
# Environment="RATE_LIMIT=24"

# Optional: Certificate directory
# Environment="CERT_DIR=/var/lib/gitea/certs"

# Optional: Additional environment variables for database, etc.
# Environment="GITEA_DATABASE_TYPE=postgres"
# Environment="GITEA_DATABASE_HOST=localhost:5432"
# Environment="GITEA_DATABASE_NAME=gitea"
# Environment="GITEA_DATABASE_USER=gitea"
# Environment="GITEA_DATABASE_PASSWD=gitea"
```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/preinst`:

```````
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

BINARY_PATH=${BASE}/usr/local/bin/gitea
SYSTEMD_PATH=${BASE}/etc/systemd/system
CONFIG_PATH=${BASE}/etc/gitea
DATA_PATH=${BASE}/var/lib/gitea

echo "id -u git &>/dev/null || adduser \
		--system \
		--shell /bin/bash \
		--gecos 'Git Version Control' \
		--group \
		--disabled-password \
		--home /home/git \
		git"
```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/README.md`:

```````md
# go-gitlooseleaf

A soft-fork of Gitea that enables simultaneous multi-protocol access via standard TLS, I2P, and Tor onion services. This repository contains only the network interface modules and CI configuration needed to build custom Gitea binaries.

## How It Works

This project leverages GitHub Actions to automatically build a modified version of Gitea that can simultaneously serve content over multiple protocols:
- Standard HTTPS/TLS connections
- I2P (Invisible Internet Project) network
- Tor onion services

The beauty of this approach is that it requires no changes to Gitea's core codebase, as Gitea intelligently encapsulates network operations through abstraction:

1. **Network Listeners**: Gitea uses `graceful.GetListener()` (defined in `modules/graceful/server.go`) for all incoming connections
2. **Network Clients**: Gitea's HTTP client connections can be configured with custom transport implementations

We take advantage of these abstractions by replacing the default implementations with our multi-protocol versions during the build process.

## Implementation Details

The network listener replacement works because Gitea's default `GetListener()` implementations (`DefaultGetListener()`) are defined in platform-specific files:
- `modules/graceful/net_unix.go` for Unix-like systems
- `modules/graceful/net_windows.go` for Windows

Our implementation introduces a `MultiGetListener()` function that handles TLS, I2P, and Tor connections using the `go-meta-listener` package, while still supporting Unix sockets for internal functions.

Similarly, we replace the default HTTP client with a version that can route traffic through the appropriate network (TLS, I2P, or Tor) based on the destination.

## Current Implementation

The current implementation in `net_mirror.go` uses:
- `go-meta-listener/mirror` for listening on multiple protocols
- Rate limiting through `go-i2p/go-limit`
- Environment variables (`EMAIL`, `HOSTNAME`) for configuration

```go
// This implements the GetListener function for TLS, I2P, and Onion
func MultiGetListener(network, address string) (net.Listener, error) {
    // Support for Unix sockets remains unchanged
    if network == "unix" || network == "unixpacket" {
        unixAddr, err := ResolveUnixAddr(network, address)
        if err != nil {
            return nil, err
        }
        return GetListenerUnixWrapper(network, unixAddr)
    }
    
    // For TCP connections, create a multi-protocol mirror listener
    ml, err := mirrorListener.Listen(address, os.Getenv("EMAIL"), "./certs", true)
    if err != nil {
        return nil, err
    }
    
    // Apply rate limiting
    return limitedlistener.NewLimitedListener(ml,
        limitedlistener.WithMaxConnections(500), // concurrent connections
        limitedlistener.WithRateLimit(24),       // connections per second
    ), nil
}
```

## Usage Caveats

While the HTTP interface works seamlessly across all three protocols, other Gitea communication channels require additional configuration:

1. **SMTP Client**: If configured, email connections from Gitea will need proper routing:
   - For I2P: Use local ports like `127.0.0.1:7659/7660`
   - For Tor: Configure appropriate SOCKS proxy settings

2. **SSH Connections**: Git operations over SSH require additional configuration to properly route through anonymity networks. These settings depend on your specific deployment environment.

3. **Environment Variables**:
   - `EMAIL`: Used for TLS certificate generation (required for HTTPS)
   - `HOSTNAME`: Server hostname (defaults to local machine name if not set)

## Installation

You can:
1. Download prebuilt binaries from the [releases page](https://github.com/go-i2p/go-gitlooseleaf/releases)
2. Use the included `install.sh` script to set up a system service
3. Build from source using the GitHub Actions workflows as a reference

## License

Both this modification and Gitea itself are licensed under the MIT license.
- See [LICENSE](LICENSE) for this project's license
- See [LICENSE-gitea.md](LICENSE-gitea.md) for the Gitea license from https://github.com/go-gitea/gitea

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/Makefile`:

```````
.PHONY: all download setup-user install-binary install-systemd enable disable uninstall clean help

# Installation paths
BINARY_PATH = ${BASE}/usr/local/bin/gitea
SYSTEMD_PATH = ${BASE}/etc/systemd/system
CONFIG_PATH = ${BASE}/etc/gitea
DATA_PATH = ${BASE}/var/lib/gitea

# Default target
all: help

help:
	@echo "GitLooseLeaf - Modified Gitea with multi-protocol support"
	@echo ""
	@echo "Usage:"
	@echo "  make download	   - Download the latest gitea binary"
	@echo "  make setup-user	 - Create git user and required directories"
	@echo "  make install-binary - Install Gitea binary"
	@echo "  make install-systemd - Install systemd service files"
	@echo "  make enable		 - Enable and start Gitea service"
	@echo "  make disable		- Disable and stop Gitea service"
	@echo "  make install		- Complete installation (all above steps)"
	@echo "  make uninstall	  - Remove Gitea"
	@echo "  make clean		  - Clean up downloaded files"
	@echo ""
	@echo "Note: Many commands require root privileges (use sudo)"

# Download latest Gitea binary
download:
	@echo "Downloading latest Gitea binary..."
	mkdir -p downloads
	GITEA_URL="https://github.com/go-i2p/go-gitlooseleaf/releases/download/nightly/gitea-Linux"; \
	wget -O downloads/gitea "$$GITEA_URL" || curl -L -o downloads/gitea "$$GITEA_URL"
	chmod +x downloads/gitea

# Setup git user and directories
setup-user:
	@echo "Setting up git user and directories..."
	./preinst
	mkdir -p $(DATA_PATH)/custom
	mkdir -p $(DATA_PATH)/data
	mkdir -p $(DATA_PATH)/log
	mkdir -p $(CONFIG_PATH)
	./postinst

# Install Gitea binary
install-binary: download
	@echo "Installing Gitea binary..."
	cp downloads/gitea $(BINARY_PATH)
	chmod +x $(BINARY_PATH)
	setcap CAP_NET_BIND_SERVICE=+eip $(BINARY_PATH)

# Install systemd service files
install-systemd:
	@echo "Installing systemd service files..."
	mkdir -p $(SYSTEMD_PATH)/gitea.service.d
	cp etc/systemd/system/gitea.service $(SYSTEMD_PATH)/
	cp etc/systemd/system/gitea.service.d/user-config.conf $(SYSTEMD_PATH)/gitea.service.d/
	systemctl daemon-reload

# Enable and start Gitea service
enable:
	@echo "Enabling and starting Gitea service..."
	systemctl enable gitea.service
	systemctl start gitea.service
	@echo "Gitea service started successfully!"
	@echo "Please configure your email in $(SYSTEMD_PATH)/gitea.service.d/user-config.conf"
	@echo "Then restart with: systemctl restart gitea.service"

# Disable and stop Gitea service
disable:
	@echo "Disabling and stopping Gitea service..."
	systemctl disable gitea.service
	systemctl stop gitea.service

# Complete installation
install: setup-user install-binary install-systemd enable
	@echo "Installation complete!"
	@echo "You can now access Gitea at:"
	@echo "- HTTPS: https://$(shell hostname):3000"
	@echo "- I2P/Tor: Check logs for actual addresses: journalctl -u gitea"

# Uninstall Gitea
uninstall: disable
	@echo "Uninstalling Gitea..."
	rm -f $(BINARY_PATH)
	rm -f $(SYSTEMD_PATH)/gitea.service
	rm -rf $(SYSTEMD_PATH)/gitea.service.d
	systemctl daemon-reload
	@echo "Gitea has been uninstalled."
	@echo "Note: User and data directories were not removed."
	@echo "To completely remove, delete: $(CONFIG_PATH) and $(DATA_PATH)"

# Clean up
clean:
	@echo "Cleaning up..."
	rm -rf downloads
```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/net_mirror_windows.go`:

```````go
// Copyright 2019 The Gitea Authors. All rights reserved.
// SPDX-License-Identifier: MIT

// This code is heavily inspired by the archived gofacebook/gracenet/net.go handler

//go:build windows

package graceful

import "net"

func ResolveUnixAddr(network, address string) (net.Addr, error) {
	switch network {
	case "unix", "unixpacket":
		return net.ResolveUnixAddr(network, address)
	case "tcp", "tcp4", "tcp6":
		return net.ResolveTCPAddr(network, address)
	case "udp", "udp4", "udp6":
		return net.ResolveUDPAddr(network, address)
	default:
		return nil, net.UnknownNetworkError(network)
	}
}

func GetListenerUnixWrapper(network string, addr net.Addr) (net.Listener, error) {
	return net.Listen(network, addr.String())
}

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/install.sh`:

```````sh
#! /usr/bin/env sh

# AS ROOT

adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git

mkdir -p /var/lib/gitea/{custom,data,log}
chown -R git:git /var/lib/gitea/
chmod -R 750 /var/lib/gitea/
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea
killall gitea
sleep 3s
GITEA_URL=https://github.com/go-i2p/go-gitlooseleaf/releases/download/nightly/gitea-Linux
wget -O /usr/local/bin/gitea "$GITEA_URL"
chmod +x /usr/local/bin/gitea
setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/gitea
su - git

```````

`/home/idk/go/src/github.com/go-i2p/go-gitlooseleaf/LICENSE-gitea.md`:

```````md
Copyright (c) 2016 The Gitea Authors
Copyright (c) 2015 The Gogs Authors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

```````