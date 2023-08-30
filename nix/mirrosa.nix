{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "mirrosa";
  version = "0.0.5";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-xFAMaERh08n4899Xkt/yide/3V5dcbF/4ere8sVKlis=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-J5qkqtOUme8agEJ7K70/sdD364r9fWcR0CL6DsjcM9o=";
}
