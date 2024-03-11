{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.25";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-8WeaL/3DgU9c11YFrRwaRCW/WeDUs+siZ9aKZvoqumE=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-ViQrmIL87j9GIJ36xoiN1EwBqAkO3J/+chVHtjO4eO0=";

  subPackages = [ "cmd/ocm-backplane" ];
}
