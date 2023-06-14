{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.16.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-vulKgCmRbYOLHxRwXB6HcJMW1VXpGJzEEZmQttRpnAw=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-laBaOFEno+AfBraEm+tcPgZa8xeCoNxYDM7FSZz3iAM=";
  doCheck = false;
}
