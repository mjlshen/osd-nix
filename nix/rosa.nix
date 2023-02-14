{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "rosa";
  version = "v1.2.14";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-+MA3r9e+oV2wRQzOmX+UR5BFKM44cIxfrNbbdNBVTBM=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
