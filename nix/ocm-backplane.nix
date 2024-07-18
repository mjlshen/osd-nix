{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.34";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-W5jhWfhgvctTKZAwTx7AcrvjMhNeoa7LMVUW65kHsNc=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-wvExDTLw2t3INBbekRJtOgR0NWS+J//gTVs3cK/PK6w=";

  subPackages = [ "cmd/ocm-backplane" ];
}
