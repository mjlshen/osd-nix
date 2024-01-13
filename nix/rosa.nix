{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "rosa";
  version = "v1.2.33";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-TqUtORKH+Iv8mSJikI0GZ3MvTDsNm635x0mX6iKcDFQ=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
