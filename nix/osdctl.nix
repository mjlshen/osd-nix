{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.26.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-trV7bU4UUBecL+85BvcZuqeVqOWruirdAYrr4zxlV9E=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-RUyjE4RQLN9MiixX2P/OG2B8sT1wINXUdpS9GbktKZY=";
  doCheck = false;
}
