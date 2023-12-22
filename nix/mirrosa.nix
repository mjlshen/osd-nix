{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "mirrosa";
  version = "0.0.8";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-3/FT8nl6AIv71ZBWvU7tyIY+Y3vQDcUsRRVyzF8bqNo=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-pbciF+rqofzXl5FkOsW4YoCduNrlGTLZOQlwrzTE3fc=";
}
