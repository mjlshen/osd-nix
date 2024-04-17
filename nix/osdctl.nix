{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.29.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-FyjJRX5UbA91EfPstUXBszjQLY69DP6EgzcNqPQRqgM=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-w2/NVzCQrs58m+IHdNVFL3K/Uw/yjAYI972R1DgmowY=";
  doCheck = false;
}
