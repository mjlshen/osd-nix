{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.71";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-ZO68DOjahQ+Xjs/+8HMhERJ27V5wLW3NBPUj0CM/H/A=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-MmDI/N/hF/gua99AX1ykE9K1onEG0Uc5CCIi+sOpB9w=";

  subPackages = [ "cmd/ocm" ];
}
