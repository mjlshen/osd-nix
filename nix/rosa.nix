{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "rosa";
  version = "v1.2.46";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-XRoHapuH0MJNrtu+Rk/yxJqeqjNIbdGYqDB84q05rdA=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorHash = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
