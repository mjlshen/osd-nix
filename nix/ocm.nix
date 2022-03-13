{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ocm";
  version = "0.1.62";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-LbceoGSZmS25Xq8xLNry50zvewHvP39Gi542bjr7YE8=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-NGOzwxcyQCtZZZveMUUUZizJbv29zOp6M3pvmCXzapM=";

  subPackages = [ "cmd/ocm" ];
}
