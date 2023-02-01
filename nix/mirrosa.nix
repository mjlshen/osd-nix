{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "mirrosa";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-7wGC4TYTs+aCCxGpKbJbDPZu2AVg7aCgyyVpR6g9JLA=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-1T6bH4wwLEEjjLrnwkewFh36FXyljEz4xSt0M7ceyWE=";
}
