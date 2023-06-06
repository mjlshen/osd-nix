{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "backplane-cli";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-HfuR4uqCre19TBHSXGSOC40bLoMpnVanI8sXRohnabs=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-OWfY9helfw5gIgA9ZhNLVXAsZ5tnVZ0flQLnWOe0a/s=";

  subPackages = [ "cmd/ocm-backplane" ];
}
