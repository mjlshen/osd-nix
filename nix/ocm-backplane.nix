{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.28";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-jsCL1B5/BjFXVTwAiVYxZSm1tcPR1GFkPPlJCQ60pR4=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-fSdLbc05FAbwh6IfyuF/J6vs+9jOVAuTAYOW7P9K62Y=";

  subPackages = [ "cmd/ocm-backplane" ];
}
