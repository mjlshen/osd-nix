{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.23";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-2prjuZ0Sp2tGTOl85b0+ekUiZ/3xiNll89BYB0MsdJ0=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-BbaVzLlBAwPo+UddxfgxVNb2jYBf33253C6PW740u18=";

  subPackages = [ "cmd/ocm-backplane" ];
}
