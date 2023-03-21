{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.14.2";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-iKnC87e/NxmIUkFotkycIo/YoqGIJkAkVzYXMbDLP/Q=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-YuOhiUZueFf8Nt7jn2Y4REP+rvULXBNBAq39tqeKXy0=";
}
