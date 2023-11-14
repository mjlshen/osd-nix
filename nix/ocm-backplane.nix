{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.17";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-AzdvK0FTrWsIQva38pR1JCn3wxoRIVlXTv/VX37dafM=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-fIg1Jc/TZxaXW8o32/j8kvWt1abcwaWSQO3XEbO/CnY=";

  subPackages = [ "cmd/ocm-backplane" ];
}
