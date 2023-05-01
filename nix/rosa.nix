{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "rosa";
  version = "v1.2.18";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-3oha60OdmF3UmI8WVCem2r8xQ3KhipfhKmZZL3B+CNo=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
