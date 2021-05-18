# Evocortex Embedded Tools Installation Files

The installation files are provided as Debian-Packages for multiple linux systems and distributions. 
To build the workspace you have to install the library and the development headers. 
An example for installing the library for Ubuntu Bionic on an amd64 system:

```
// Install evo-mbed-tools library
sudo dpkg -i libevo-mbed-tools_1.0.3-1368~ubuntu~bionic_amd64.deb

// Install evo-mbed-tools library headers
sudo dpkg -i libevo-mbed-tools-dev_1.0.3-1368~ubuntu~bionic_amd64.deb
```

A list of supported distributions and architectures is shown below:

| File-Ending | Linux-Distro | Codename | Architecture | System |
|-------------|--------------|----------|--------------|--------|
| debian-buster-amd64  | Debian | Buster       | amd64 | PC           |
| debian-buster-armhf  | Debian | Buster       | armhf | Raspberry Pi |
| debian-stretch-amd64 | Debian | Stretch      | amd64 | PC           |
| debian-stretch-armhf | Debian | Stretch      | armhf | Raspberry Pi |
| ubuntu-bionic-amd64  | Ubuntu | Bionic 18.04 | amd64 | PC           |
| ubuntu-bionic-arm64  | Ubuntu | Bionic 18.04 | arm64 | NVIDIA Tegra |
| ubuntu-focal-amd64   | Ubuntu | Focal 20.04  | amd64 | PC           |
| ubuntu-xenial-amd64  | Ubuntu | Xenial 16.04 | amd64 | PC           |
| ubuntu-xenial-arm64  | Ubuntu | Xenial 16.04 | arm64 | NVIDIA Tegra |