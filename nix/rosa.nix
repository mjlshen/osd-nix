{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "rosa";
  version = "v1.2.29";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-aUPCGkCvNojkyNunuV46XdhN/WB7e8fCSptETEEGgDY=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
