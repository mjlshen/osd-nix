{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.17.0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-5stvOZumHVNA607Z34KvDCtnk6GQ+kGsuccYB0ulGGI=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-mz5GhKmvtgQwic1AMWScEoU5xI71vIq/t8pOJq6eXtw=";
  doCheck = false;
}
