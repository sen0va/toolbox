# README.md

## Toolbox Docker Image

This Docker image provides a lightweight environment based on Debian Linux, equipped with a variety of CLI tools for network diagnostics, Kubernetes management, and general-purpose tasks. It's designed to be a swiss-army knife for developers and system administrators.

### Features:

- **Base Image**: Debian Linux - known for its small size and security.
- **CLI Tools**: Includes tools like `openssl`, `ping`, `traceroute`, `docker-cli`, `zsh`, `git`, `curl`, `wget`, `tcpdump`, `nmap`, `rsync`, and more.
- **Kubernetes Tools**: Comes with `kubectl`, `helm`, `kubectx`, and `kubens`.
- **Shell**: Uses the `zsh` shell with the `agnoster` theme from `oh-my-zsh`.

### Maintainer:

Özkan Şenova

### Build Instructions:

```bash
docker build -t sen0va/toolbox .
```

### Usage:

Run the container interactively:

```bash
docker run -it --rm sen0va/toolbox
```

Check the `openssl` version:

```bash
docker run -it --rm sen0va/toolbox openssl version
```

### Included Tools:

- **Network Tools**: `ping`, `traceroute`, `net-tools`, `iputils`, `iproute2`, `bind-tools`, `tcpdump`, `nmap`
- **General Tools**: `docker-cli`, `zsh`, `git`, `openssl`, `curl`, `wget`, `rsync`
- **Kubernetes Tools**:
  - `kubectl`: v1.15.0
  - `helm`: v2.14.3
  - `kubectx` and `kubens`: Latest versions from the official repository.

### Customizations:

- Default user is set to `root`.
- Default working directory is set to `/root`.
- Default shell is set to `zsh` with the `agnoster` theme from `oh-my-zsh`.

### Contributions:

Feel free to open issues or pull requests if you have suggestions or improvements for this Docker image.

---

**Note**: Always ensure you understand the contents and implications of a Dockerfile before building and running it, especially when running as `root`.asd
asd
asd
asd
asd
asd
