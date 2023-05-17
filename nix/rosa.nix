{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "rosa";
  version = "v1.2.22";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-7Vn8iRliu0IDInP/n+1vh9xvTEy4ye3RBWAlAWHSWc4=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
