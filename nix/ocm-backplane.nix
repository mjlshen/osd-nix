{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.12";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-NL6XMun/zlf069/BLVPKj2q3xbnqhjl8Q4mbjGUXZJk=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-v7D+YKYlCOajE2t7KOC8Eqd1ZCqBjjmoeZ8CCoXjSuA=";

  subPackages = [ "cmd/ocm-backplane" ];
}
