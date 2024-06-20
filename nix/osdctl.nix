{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.33.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-reczchG0mU7VxPbqFm8Q35kmad/1qzyeyrSNq/+adjo=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-Ks98y1CZZky6g9AhuO34w+ktnHGUkzB7DoFSr9iabiQ=";
  doCheck = false;
}
