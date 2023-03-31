{ buildGo119Module, fetchFromGitHub }:

buildGo119Module rec {
  pname = "mirrosa";
  version = "0.0.4";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-3hwQxXc3R1qk8alVlY/xuoSZjThrnNn2P+YnmaSLWNE=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-4pmBYoVqWTu29JI9QIrofbuEMmFhnIluS2OENan7wmA=";
}
