{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "osdctl";
  version = "0.18.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-cyo/+q6+eDUQeXuPxqxblwIYtH7PYsHVxbwS4v3cF8A=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-f3a2u2vNUxOEsnZCO65b12ihk1HFjyQF5R165sMCXbA=";
  doCheck = false;
}
