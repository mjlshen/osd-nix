{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.14.4";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-b0C+BM7PdMq4rE0RaY7yeDGaz6ARgUYGApbFRp46KN8=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-qjKtV51RH/ums+kR94KoYG2Jg7ySNzKzz/hjuCRRamg=";
  doCheck = false;
}
