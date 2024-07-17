{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "rosa";
  version = "v1.2.42";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-HyfplyxZi0VxLCyLvW3OudFibvXGV70AI3vSdl9R1aA=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
