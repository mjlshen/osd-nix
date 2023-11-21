{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.19";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-VzNrCbeitLfAaDdYK/FLDSx70wLRyuu48NTFe3aQxPo=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-d9+urubt1SKMX2BymeNzq/IwoH6kRzg3KjmAJ4egv6Y=";

  subPackages = [ "cmd/ocm-backplane" ];
}
