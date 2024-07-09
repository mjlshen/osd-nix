{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.34.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-quvSvLVrz7ha0MlZoGjA21ISq5w9vW507cGcm5Wn+Jo=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-/ClI5JWoARsKJrnWwRzSYhbFqihDCZeUGM2mSXwqq9E=";
  doCheck = false;
}
