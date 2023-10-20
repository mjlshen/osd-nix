{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.14";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-oaUfQZ2msF1dGkNTX7vy+t/3dmt5rt3IGOmWl/IERC4=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-VbVCVmiYdv5+gpsGopOY5TpyoJq8jUkqW5kJYAilHXs=";

  subPackages = [ "cmd/ocm-backplane" ];
}
