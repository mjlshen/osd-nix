{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "osdctl";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-wHQsxI5reVH1YfN7NJcR07RZrVh7qLcXJ1Oi5ii4Lsg=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.GitCommit=${src.rev}"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  # 0.9.6 regression
  doCheck = false;
  vendorSha256 = "sha256-RRDRCAsQZyzBB1RvVcErF3Sui7U02Uo+grJZn7yfz5E=";
}
