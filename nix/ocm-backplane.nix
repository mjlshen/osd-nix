{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "backplane-cli";
  version = "0.1.6";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-at9f6vT2T8EAMas4tJRQISPqCDBwHl4ozIpDcxTowic=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-SlO0OpFuQI0w0R/iNvSDwzajA2UsNp0XakGHVxdLi/M=";

  subPackages = [ "cmd/ocm-backplane" ];
}
