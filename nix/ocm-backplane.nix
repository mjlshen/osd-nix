{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.11";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-t5BqqIPKZhsXzOGUX9L4/u1C2N3sizl1lDnLjY52jhM=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-t86Le+txDsFo++jOwxSmc1jmpQiWp0qovBS4xnyLMyA=";

  subPackages = [ "cmd/ocm-backplane" ];
}
