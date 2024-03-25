{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.28.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-+23OkWlPlGZZPjuhBSp1Id1H+Ep67DciFmTSlD8bbCo=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-Lzdp422N6pNXzOh2hNpQSkB8m2kSHHL1eKl3iAhWHig=";
  doCheck = false;
}
