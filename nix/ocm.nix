{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.70";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-J/CN1cxEcKiEt8WMg79nA4y0gp18vSDEsBqvYuQVaIk=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-3HLTuWf4mK3r92s2mPE2yl/rrPxgcsB9EmrxkiJsMaE=";

  subPackages = [ "cmd/ocm" ];
}
