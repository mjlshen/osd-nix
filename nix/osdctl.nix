{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.27.1";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-aIDaiT51ceELEqQda16+brRYS3XM9mJDdaIaTPGDiLo=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-Lc243e3HrxvO4QlfchZsomAPkF+TaN5SidyAgm/EvtA=";
  doCheck = false;
}
