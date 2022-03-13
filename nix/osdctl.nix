{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "osdctl";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-NMAGs63igCd7HGMOT2XBOR2RcEvh1HYZT3K2+g1w6GU=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.GitCommit=${src.rev}"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  vendorSha256 = "sha256-mzcQ4StTCjMz+qLWo0/ITTGxRWljz3hNqRBG97hJKoY=";
}
