{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "rosa";
  version = "v1.2.11";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-HphNFVYpLzz70ZDWqOLwJ05ktrm8Wx78NRGsHBkYTNg=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;

  subPackages = [ "cmd/rosa" ];
}
