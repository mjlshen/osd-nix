{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.14.3";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-eQIH0clxOi7IJUlbvVynn4f8gmy4wd5/V4X0S/1dnjE=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-+h/uFHNK3+lBLlZRzwLJ4fYnPnUu+xBbcWDp+/+eMP8=";
  doCheck = false;
}
