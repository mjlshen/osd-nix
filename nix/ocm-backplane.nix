{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.30";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-gu/59XGr/E/s/yIR+Hd/VvEanFfKlq7N1/Z6/dqPpig=";
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
