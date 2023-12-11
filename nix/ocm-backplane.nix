{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.20";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-//U01eJvVkhKyUzwUqaws891YuorS2ChPvplOOxqnQE=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-BS9W0x8wmW12dDuciqsBrLQnaqktUiWfcq1r6S3H0/I=";

  subPackages = [ "cmd/ocm-backplane" ];
}
