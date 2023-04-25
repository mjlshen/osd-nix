{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "backplane-cli";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-UHvfys9fIspIz4vyaNrkBZ/rihhfjAfwb6HqyoYZnGo=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-SsidKmqXKiLrgEtX1nTRmyirEuM/HeBDxAxyLuNUVvc=";

  subPackages = [ "cmd/ocm-backplane" ];
}
