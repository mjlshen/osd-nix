{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "rosa";
  version = "v1.2.13";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-ngbKZUBcxJWMwXEC8LJq4igExsp/+DYSwtYFr53Hl0Q=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
