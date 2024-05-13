{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.31.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-mtDCyc5yfuXNPqhaSDJ7SS+S4B9YpY4VoY2jWMkCJdg=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-IVB3xgHdrRHGchUqshCPYhWLMEEVLX6iS9toIJrnTms=";
  doCheck = false;
}
