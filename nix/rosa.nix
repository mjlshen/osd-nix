{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "rosa";
  version = "v1.2.30";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-Uu+LmGiejhoktWh9v2kzZId2UbOWQmbfrP0LWx3yHr0=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
