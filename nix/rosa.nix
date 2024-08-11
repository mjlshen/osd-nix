{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "rosa";
  version = "v1.2.43";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-1/go7mL2uRzzV/iiTXsgZHGNW8EIONwEnb4jcMiKkv4=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
