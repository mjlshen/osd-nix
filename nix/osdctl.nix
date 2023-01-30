{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.13.6";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-RzKWxlnaeWtTPyd07/OUY4CWt+lA4SeI2A6nPbJQrPo=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-YeQROdHdm/BHNlN4M8TG3IOWVGqjqx/CxgtrnUmcbrk=";
}
