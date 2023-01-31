{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "mirrosa";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-+AEEIBnOxQgdbZif4VPaJYXn9O9BatYkpqzLa7Srt+E=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-FduSCdDWoaQyPq5GPCN8y6OMLzz+0aD02qUBVTpi2HE=";
}
