{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.27.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-Vih/C/LgLgmWMLzcq6JvWQ1deOqybZ2c5kL+hUoJ5ug=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-XsJsgmJiKNeChSos+OPxmbR0w8qS6Jwsmf1dnIDfF44=";
  doCheck = false;
}
