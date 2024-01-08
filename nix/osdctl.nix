{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.22.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-Ly91KJfL9MITKfSZDpOLrrh1W+rwMDBrzxIJc+Xwd8M=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-XI4CK+MUP/lZp4w0o0aBHPnODGdqA2LYvJwbcrM0j04=";
  doCheck = false;
}
