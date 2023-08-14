{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "backplane-cli";
  version = "0.1.10";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-g62S1JCpA/Q66u6C64baLnjfd/UCdPsJawj5R2FMTuc=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-8ifNHQz4qHIgQNUSy5rYqTYKnu9xnT5WctC4g6IBD0I=";

  subPackages = [ "cmd/ocm-backplane" ];
}
