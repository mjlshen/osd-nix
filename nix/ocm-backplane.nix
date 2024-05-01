{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.29";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-EuWZmKTB8RtlngAX+/YRe/rSMA8SZqsZWZpUe1KZyEQ=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-D+v92FUIBvxJKuaJ9L5ogr6ITwtZKO7XANPga9ga/gQ=";

  subPackages = [ "cmd/ocm-backplane" ];
}
