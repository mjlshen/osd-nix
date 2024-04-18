{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.30.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-3Qd+mXVpL/y0eUGXBqCvFRgRSVv7lod8Kq7JAGqWVMk=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-o1Nx5R/bV95Fg4MwshQik0kTj4GHiipNVPzx4gJ0yJM=";
  doCheck = false;
}
