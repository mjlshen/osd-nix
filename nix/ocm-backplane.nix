{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.36";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-sAq0NKclL9gOFqdc9QE8fp2QQA9mwBZ9KCwszYIIFfk=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorHash = "sha256-yq/f3ArhU22MTto0+J38oU7v58Ih1NUvwRpVWRku9mU=";

  subPackages = [ "cmd/ocm-backplane" ];
}
