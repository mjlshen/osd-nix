{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "osdctl";
  version = "0.13.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-pJl8lSFH3/HBX4R4+pYCrxJOFGfJCZuQzfDaX9Jg6z0=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.GitCommit=${src.rev}"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  vendorSha256 = "sha256-mHY+EVrqF40NFitV+GBQ2Sh7P3GIddHD9uDnbOYwIYI=";
}
