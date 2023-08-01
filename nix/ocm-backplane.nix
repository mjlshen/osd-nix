{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "backplane-cli";
  version = "0.1.9";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-zKXxYkfElOe1F8mRlBOQwXN2Yl6ZqmDV0J41yb6DwBw=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-KgG5/ihfrrphlYlzBgeNG6vJsgN4WHWCdhAwES9MD7E=";

  subPackages = [ "cmd/ocm-backplane" ];
}
