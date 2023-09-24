{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.67";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-MNagqeT6Uw9fLl6gJ+2FYTRZ2rO2qTYi8SBDoOR9EUM=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-4d8IGe/gTt4HAqyg05pYtAFfHp6NCmUBtfxRA64rEmM=";

  subPackages = [ "cmd/ocm" ];
}
