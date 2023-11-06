{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "osdctl";
  version = "0.20.1";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-SLPrrzRMCmd+YK0pJpTcwcCw4fVEJdiSbSvu6Q82pJU=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-2IsrQL90evljeKNwrUhWl1nKdpD35qVhCw4985NbTcA=";
  doCheck = false;
}
