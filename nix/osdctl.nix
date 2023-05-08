{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.15.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-TxL/a9Gis5IPVQ+SNUe++ZUmAHc+W/NTpRb7I4FE+YY=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-QsJfR6PR7LZGGN9xWIZun5kdvH7msTvHkkfybi3tfEw=";
  doCheck = false;
}
