{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "backplane-cli";
  version = "0.1.8";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-L/q17WdIEO91xYrIXJI6UKSFDdNCeSV4HYMwXN72jag=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-ctyj+CkmQ0edLf0HUOKEYBF7rY8T9blA8qBRXPcml9Y=";

  subPackages = [ "cmd/ocm-backplane" ];
}
