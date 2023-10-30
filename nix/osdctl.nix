{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "osdctl";
  version = "0.20.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-T0y0YcRmn2dX4uRmLCjQQ1AigjGTVsa176lHsDXVamc=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-bxrrEo+GiCw7DlBcFTk2VkO/2bnMLJ2jdmE8FsGfqHY=";
  doCheck = false;
}
