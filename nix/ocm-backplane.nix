{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.26";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-MdNTrhvKdg6mgbef/OCcDx6rtrBCkdEXiND7fE0Et1k=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-mrB2k3s7iWvG3aOqjMsFmOso+JzjJcRV3ddVo+h28d4=";

  subPackages = [ "cmd/ocm-backplane" ];
}
