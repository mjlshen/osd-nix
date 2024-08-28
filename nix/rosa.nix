{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "rosa";
  version = "v1.2.44";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-mBu0tvFHWdUqY4wByhfgtpCjKeDjnQ75lLY7cIIRy/w=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorHash = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
