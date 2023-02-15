{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.14.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-Ej9KtgfqomaAVooK0KakXh7HDyQj0AESVUryCkqnEhU=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-YeQROdHdm/BHNlN4M8TG3IOWVGqjqx/CxgtrnUmcbrk=";
}
