{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "osdctl";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-QVoyXAPNgJqqnthx/M2ChSMHa0yMpFDOznw1OkVqU18=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.GitCommit=${src.rev}"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  # 0.9.6 regression
  doCheck = false;
  vendorSha256 = "sha256-ryJIgvToO/7hjgUngMr37MUPwyJjx4hDe5W7JLKGNAA=";
}
