# go-gitlooseleaf

A soft-fork of Gitea that enables simultaneous multi-protocol access via standard TLS, I2P, and Tor onion services. This project enhances access to Gitea repositories across diverse network environments without compromising core functionality.

## Features

- **Multi-Protocol Access**: Access your Gitea instance simultaneously through:
  - Standard HTTPS/TLS connections
  - I2P (Invisible Internet Project) network
  - Tor onion services
- **Complete Protocol Support**: All Git operations work seamlessly across all networks:
  - Web interface for browsing and management
  - Git operations over HTTPS
  - Git operations over SSH (when using Gitea's built-in SSH server)
- **Minimal Configuration**: Requires minimal changes to standard Gitea setup
- **Censorship Resistance**: Maintains repository availability even when specific networks are blocked

## How It Works

go-gitlooseleaf leverages Gitea's modular network architecture to enable multi-protocol access without modifying the core codebase. The implementation replaces Gitea's network interfaces with protocol-aware alternatives:

1. **Network Listeners**: Gitea uses `graceful.GetListener()` (defined in `modules/graceful/server.go`) for all incoming connections, which we replace with our multi-protocol implementation
2. **Automatic Protocol Detection**: The system automatically detects and routes connections through the appropriate protocol
3. **Rate Limiting**: Built-in protection against excessive connection attempts

## Implementation Details

The network listener replacement works by providing a custom implementation of Gitea's `GetListener()` function:

```go
// MultiGetListener handles connections across TLS, I2P, and Tor
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
    
    // Apply rate limiting for protection
    return limitedlistener.NewLimitedListener(ml,
        limitedlistener.WithMaxConnections(500), // concurrent connections
        limitedlistener.WithRateLimit(24),       // connections per second
    ), nil
}
```

## Configuration

### Basic Setup

1. **Environment Variables**:
   - `EMAIL`: Used for TLS certificate generation (required for HTTPS)
   - `HOSTNAME`: Server hostname (defaults to local machine name if not set)

2. **Gitea Configuration** (app.ini):
   ```ini
   [server]
   START_SSH_SERVER = true  # Enable built-in SSH server for multi-protocol SSH support
   SSH_PORT = 22            # Must end with "22" for automatic SSH mirroring (e.g., 22, 2222, 10022)
   ```

### Network Addresses

Your Gitea instance will be available at:
- HTTPS: `https://yourdomain.com`
- Tor: `http://youronionaddress.onion` (automatically generated)
- I2P: `http://youri2paddress.i2p` (automatically generated)

Access using Git clients:
```bash
# Clone via HTTPS
git clone https://yourdomain.com/username/repo.git
git clone http://youronionaddress.onion/username/repo.git
git clone http://youri2paddress.i2p/username/repo.git

# Clone via SSH (when using built-in SSH server)
git clone git@yourdomain.com:username/repo.git
git clone git@youronionaddress.onion:username/repo.git
git clone git@youri2paddress.i2p:username/repo.git
```

## Installation

You can:
1. Download prebuilt binaries from the [releases page](https://github.com/go-i2p/go-gitlooseleaf/releases)
2. Use the included `install.sh` script to set up a system service
3. Build from source using the GitHub Actions workflows as a reference

## Use Cases

- **Self-hosting enthusiasts**: Offer your personal Git repositories through multiple networks with a single installation
- **Code hobbyists**: Share your projects with friends regardless of their network constraints or preferences
- **Organizations in regions with network restrictions**: Ensure repository access despite local network limitations
- **Open source projects**: Maximize availability of your codebase to contributors worldwide
- **Educational institutions**: Provide consistent access to course materials and student repositories
- **Privacy-conscious development**: Enable contribution without requiring standard TLS connections

## FAQ

**Q: Does this affect Gitea's performance?**  
A: There is minimal performance impact for standard TLS connections. I2P and Tor connections will have the typical latency associated with these networks.

**Q: How do I view my .onion and .i2p addresses?**  
A: After starting the service, addresses are displayed in the logs and stored in `./certs/hostname.onion` and `./certs/hostname.i2p`.

**Q: Can users have different identities on different protocols?**  
A: No, user accounts are shared across all protocols. This is an availability enhancement, not an anonymity solution.

**Q: Is this compatible with Gitea upgrades?**  
A: Each version is built against a specific Gitea release. Check the releases page for compatibility information.

**Q: Do I need to run Tor and I2P services separately?**  
A: Yes, you need to run Tor and I2P routers. 

**Q: Why must the SSH port end with "22"?**  
A: The automatic protocol detection for SSH connections relies on recognizing the port number pattern. Any port ending in "22" (such as 22, 2222, 10022) will work correctly.

## License

Both this modification and Gitea itself are licensed under the MIT license.
- See [LICENSE](LICENSE) for this project's license
- See [LICENSE-gitea.md](LICENSE-gitea.md) for the Gitea license
