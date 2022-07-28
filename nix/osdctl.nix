{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "osdctl";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-J8uYPMwuaKP+4s6hlfR88Pwt5g1JdSDMa9+NS7/eKSA=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.GitCommit=${src.rev}"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  # 0.9.6 regression
  doCheck = false;
  vendorSha256 = "sha256-2fRrDP3eZqnFFqcxCU+wYEtUY/1Aumldfw3baVMUWCg=";
}
