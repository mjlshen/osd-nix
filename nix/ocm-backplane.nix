{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "backplane-cli";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-wzEQxbx9gTRENmh6Fc5+AmrThBx1F3qHGv9c2AJ2mV4=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-dZCXMYWtVgNc4vUqsx6yr+1SqaGgj96WX5x7r19Ladw=";

  subPackages = [ "cmd/ocm-backplane" ];
}
