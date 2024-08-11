{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.35";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-HPDx4qfNpNma9CUNmT7rh3kKiZPUJlbclgNDiY9/cho=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorHash = "sha256-K4+4b9mwSuGU/gHK+o6RZzDW+9jQMF1DyRugYq2A6ss=";

  subPackages = [ "cmd/ocm-backplane" ];
}
