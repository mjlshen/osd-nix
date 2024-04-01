{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.27";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-jcvtZQ9iUbR9ADZvkq1wKRfbSF/frlfBHlvErKNsutQ=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-Z4WYNyTULSdq34eS8LsrpY7vm3+hgFxbEObEak08YXM=";

  subPackages = [ "cmd/ocm-backplane" ];
}
