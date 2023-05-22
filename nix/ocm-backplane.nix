{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "backplane-cli";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-nclB/SGRHEAhcCTRAI2YgORBhGtEJZG0UctfOGKcXg8=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-j6uY5ficZ154PXzGSv7AaAc2TIH3V+qljzGdlueih9U=";

  subPackages = [ "cmd/ocm-backplane" ];
}
