{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "backplane-cli";
  version = "0.1.7";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-SC+KrxBKD5Z9a8ohMAD5lqqP8POBe5OcMwhaDql3+UM=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-i9qkbpadkrM5httDCI/E3kGy4wQk7H9V/he90KHoKSA=";

  subPackages = [ "cmd/ocm-backplane" ];
}
