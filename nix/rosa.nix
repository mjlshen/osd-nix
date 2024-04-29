{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "rosa";
  version = "v1.2.38";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-eS9mK5iK/fXWMpgA/RF7wYybcJtPDW/pIWo9Iw0I+K8=";
  };

  CGO_ENABLED = 0;
  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;
  doCheck = false;

  subPackages = [ "cmd/rosa" ];
}
