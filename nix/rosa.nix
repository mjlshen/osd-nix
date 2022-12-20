{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "rosa";
  version = "v1.2.10";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-jdXM5w+9FfGEKC4MF9dbTDlng8agJM10qQtMDpom6zs=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;

  subPackages = [ "cmd/rosa" ];
}
