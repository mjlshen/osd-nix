{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.32";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-ex4QZKxjAx1gnaUYyE1vbYHIfM9/YxNKzjC0Og2ms1U=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-Gof1mcVZkmm1yNIx8Gw7pYM9pYZUWQzxSRa4m9SdWww=";

  subPackages = [ "cmd/ocm-backplane" ];
}
