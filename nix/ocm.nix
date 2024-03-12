{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.72";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-M8zyrGu73SnlHlns5kiUeocSZtsfp4DG6VISLegPb+4=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-bDjrciUQmh35E7XdWTjao/UjT6/H5cS0KlaqlmUJjFU=";

  subPackages = [ "cmd/ocm" ];
}
