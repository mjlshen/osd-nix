{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "rosa";
  version = "v1.2.24";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-7IRaqhJh7Vog008irlTXFdOkG2mDzIn0Oa17FrCgQ6s=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
