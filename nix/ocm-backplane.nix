{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "backplane-cli";
  version = "0.1.16";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "backplane-cli";
    rev = "v${version}";
    sha256 = "sha256-HDmSIZeehZ/gTU2kNPWgPMqqmhN6oHjIICGKwvUbEgA=";
  };

  CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/backplane-cli/pkg/info.Version=${version}"
  ];

  vendorSha256 = "sha256-3JgHIJbgzgoKM5dYpyQ5MdSGZexKi4Rf1vjQeKL+a90=";

  subPackages = [ "cmd/ocm-backplane" ];
}
