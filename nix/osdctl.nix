{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.24.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-/qXj+hfqp+60VW04xda8RceWRFDjcvBdlp+KSWKLdOc=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-IXLHmeU7cHr7G3eRX+8NTFzb9L7BXWrXu08EabZjw9w=";
  doCheck = false;
}
