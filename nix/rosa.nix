{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "rosa";
  version = "v1.2.41";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-AtrpVcVYnKW1SwBro/hfv4Fpt+t1UiNSzwNUMaxG4Ws=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
