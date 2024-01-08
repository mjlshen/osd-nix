{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.22";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-nTtH9SCw8kpDO/gQz7LK7Mv8XJTiqKboJLQxPkPdU88=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-BoPmx7Jvik9K4tZ6EXBkeSXqW2zP4Xl6TzVUGKhpiDE=";

  subPackages = [ "cmd/ocm-backplane" ];
}
