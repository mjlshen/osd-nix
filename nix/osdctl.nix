{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.25.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-rrrrcOI+IiC4+6wo/x2xh4N0+EcqHwbCYZrI7Pcr6Sk=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-SmqLTdnZRuooOAeXm4MomvJpa0jkRfyFfvE7qieiG2U=";
  doCheck = false;
}
