{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "backplane-cli";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-YcNEW40IHWd77320ruXraA/RaJ4NMfeRVhGR6ZDystA=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-dZCXMYWtVgNc4vUqsx6yr+1SqaGgj96WX5x7r19Ladw=";

  subPackages = [ "cmd/ocm-backplane" ];
}
