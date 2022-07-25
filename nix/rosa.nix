{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "rosa";
  version = "v1.2.5";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-OhE2mbRGCekAebCsaSbhHkyYPhoMGqy8AMv8OsNaLC0=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;

  subPackages = [ "cmd/rosa" ];
}
