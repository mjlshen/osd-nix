{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "rosa";
  version = "v1.2.34";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-TaGvG8GskCciMBmXm9i6pgwQSop3YCLnlhG5HAIaGLk=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
