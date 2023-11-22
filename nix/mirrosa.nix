{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "mirrosa";
  version = "0.0.7";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-KzxbnjJobUXF1oBGL4GTW8ErKCXiUR/IJSlAA554ops=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-IHprVBKYo1Q2zFj82AsDJaRS1VwRYXqJg3+ierwM+1o=";
}
