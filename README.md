# osd-nix

This repository is a Nix flake containing tools needed as an OpenShift Dedicated SRE. This workflow allows standard tooling and versions to be available while on-call without forcing these to clash with other versions that are installed.

## Prerequisites

* [Nix package manager](https://nixos.org/manual/nix/stable/installation/installing-binary.html#multi-user-installation)
  * [Enable Nix flakes](https://nixos.wiki/wiki/Flakes#Non-NixOS)
* direnv (recommended, but optional)
  * Note that after installation, e.g. `brew install direnv`, it needs to be [hooked into the shell](https://direnv.net/docs/hook.html)

## Getting Started

1. Clone this repo and change directory in

    ```bash
    git clone https://github.com/mjlshen/osd-nix.git
    cd osd-nix
    ```

2. If direnv has been installed, an error like the following will appear:

    ```log
    direnv: error /path/to/osd-nix/.envrc is blocked. Run `direnv allow` to approve its content
    ```

    Running `direnv allow` will load the packages defined in this flake into your path while inside this directory. The first time, this compiles many of the packages from source, so it can take some time - afterwards it's instantaneous.

3. Without direnv, a temporary shell can be started containing all the packages defined by this flake with

    ```bash
    nix develop
    ```

    Like when using direnv, the very first time `nix develop` is run, many of the packages are compiled from source, so it can take some time.

4. All available packages can be found in [nix/openshift-sre.nix](nix/openshift-sre.nix) with all other custom packages contained inside the [nix](nix/) folder. Other packages that are otherwise installed remain in your path.

## Why not Homebrew?

Mostly novelty...

but if it catches on it's a really convenient way for a cross-platform, hermetic, and standardized environment. Notably for macOS users, it would eliminate the necessity to mount local directories into containers to run like [boilerplate](https://github.com/openshift/boilerplate) or [ocm-container](https://github.com/openshift/ocm-container) if Nix flakes were provided in each repo. That way, anytime a contributor updates a package in the flake, it's fixed immediately for all other contributors without a dependency on locally installed packages!
