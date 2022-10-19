{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "rosa";
  version = "v1.2.8";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-4S6AWBRML9Sexbxg9p/lJQp3gqYAdcM/zYXG+Md5Lak=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;

  subPackages = [ "cmd/rosa" ];
}
