{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.31";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-yYQC2GUBAUEqEDNxnmowXOC1I5AgmkUZ/irIUTTDAv8=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-AZAPEfZbglTfrA/AInnAokGIV0VEJO2CL+fR0JJyoG8=";

  subPackages = [ "cmd/ocm-backplane" ];
}
