{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.13.4";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-dEBXl1S7/IfXQSbA8AZu8Wc/t5lTFhJR667wXmWxPTg=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.GitCommit=${src.rev}"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  vendorSha256 = "sha256-8pv2HayEVTWOvQX0oRbOg6O5QcEdSB5nhm/Qf8nqBds=";
}
