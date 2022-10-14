{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "osdctl";
  version = "0.13.1";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-qJktzB0h36GXlnWMgLdA1Iaijy0sXLMaix3CmOGt7Ag=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.GitCommit=${src.rev}"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  vendorSha256 = "sha256-7a6aw5FQIgvUq58p4zVmXlUYU0LkKA/3ranXOtBrsEQ=";
}
