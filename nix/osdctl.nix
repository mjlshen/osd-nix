{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "osdctl";
  version = "0.21.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-+nOLg4xsxrAXsf7GExTkNiL6nOfmt9MfX412HXl0Rcs=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-RpCFcsTC2ePCVaHGfYv2RpnuBaj6DvcV9SROyJZcVTc=";
  doCheck = false;
}
