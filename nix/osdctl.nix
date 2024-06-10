{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.32.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-RhQNilstgnDJdOIqOmKSsp5MnOAmTsXJVp80OFVC8/s=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-Vz7WmmxcS7agoqjVVtFvx6jTKuBVzu2AUCnTBR0Xcws=";
  doCheck = false;
}
