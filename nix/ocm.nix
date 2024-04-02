{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.73";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-hcbCUzC+E7VHmqATw/1LQxdMLiFibgYiWrQHpm3jZLA=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-NP5LLP27hn8p2gUVO/qpdu1Yp3t8iarUUKR/FjU0Qlc=";

  subPackages = [ "cmd/ocm" ];
}
