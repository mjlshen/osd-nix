{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.13.7";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-6Zks14n3S56QFnYSWZ7a2mOG+mgG03AiL6Q6A/K5LIo=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-YeQROdHdm/BHNlN4M8TG3IOWVGqjqx/CxgtrnUmcbrk=";
}
