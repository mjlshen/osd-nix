{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "osdctl";
  version = "0.36.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-zUgO3tvu7qKu2A3eYsmJMfWW7GUbS/rSOF0dSDhlSWs=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorHash = "sha256-OlhLkJIVLz9hAWFEXFsCxcxUyDmzZOubQ5Hb8SqrZKw=";
  doCheck = false;
}
