{ buildGo123Module, fetchFromGitHub }:

buildGo123Module rec {
  pname = "mirrosa";
  version = "0.0.10";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-Wl0Vx5exzGJqneb4D8sdDq3B4vw1utA6C5D5st+fA+I=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorHash = "sha256-hk5LSTyPctLLHkFAGo/QwCr7AE0T8+wdDunyX9Zq9nw=";
}
