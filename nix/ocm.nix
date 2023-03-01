{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.66";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-iOgDWqP9sFd5/0e5/+WP6R3PpJa8AiUE4EjI39HwWX8=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-yY/X0LVIH1ULegx8MIZyUxD1wPNxxISSCBxj9aY2wtA=";

  subPackages = [ "cmd/ocm" ];
}
