{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.37.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-pmwezavrwom2XVfxxh/gWbdeJrktK1lvUabpNtwKnqk=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorHash = "sha256-e1girEOeL8y372KpGKFbnresclGtYGyXQy0NsZ26Ghg=";
  doCheck = false;
}
