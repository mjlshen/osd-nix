{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "rosa";
  version = "v1.2.32";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-Z1NcSE/mwC7ezGIxCrRI/CgCkl7OZTgCdBvj/vhPhuQ=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
