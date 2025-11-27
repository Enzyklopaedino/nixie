# My NixOS Flake

<div align="center">
    <img src="https://img.shields.io/badge/Uses-Flake-4c72bb?style=for-the-badge&logo=nixos" alt="NixOS" />
</div>

This is my personal [NixOS](https://nixos.org/) configuration for my desktop.

> [!IMPORTANT]
> this project is still ongoing, so a lot of things may change. This is why I don't recommend anyone to use this config

## Getting started

Install NixOS

```basj
curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=nixos-25.05 bash -x
```

Clone this repository.


Rebuild your system:

```sudo nixos rebuild switch --flake .```

