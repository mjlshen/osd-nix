{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.14.1";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-MYYkR7ri67QEbpgkyCXMucby+M3fFwpIB15EvibTJQk=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-YuOhiUZueFf8Nt7jn2Y4REP+rvULXBNBAq39tqeKXy0=";
}
