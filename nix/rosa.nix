{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "rosa";
  version = "v1.2.45";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-Yjsk2A5itmTtOYM5UxSzQXNrBV9m1C8eXM0QUDjX2cI=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorHash = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
