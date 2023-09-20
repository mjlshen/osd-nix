{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.68";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-pJ/QWdKLVKFQuaGO9sNf6lhMMgqk9VZS9NLtUz+2+t8=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-3HLTuWf4mK3r92s2mPE2yl/rrPxgcsB9EmrxkiJsMaE=";

  subPackages = [ "cmd/ocm" ];
}
