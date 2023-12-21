{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.21";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-WCusyuyu2+VZkTLoHhgJ+6B84Plle9w4jn9woBwQlag=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-bgEb3Ukz8ccVx4HyXwWiaXvXzA5HC4SGD+Zgb1/ed4k=";

  subPackages = [ "cmd/ocm-backplane" ];
}
