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
