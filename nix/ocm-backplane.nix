{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.33";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-FUvEVy/r4gZ7h47iT/E9kM/C9WxIXz/D03CSYmkVkr0=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-RYmN5+yheSnXZvIQGNbbwb2rsK6gqSD6kbcE6F3b5JQ=";

  subPackages = [ "cmd/ocm-backplane" ];
}
