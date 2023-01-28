{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "osdctl";
  version = "0.13.5";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-4ltA0fpnLz1/6zYrkF6MZqioTmQBqmjcdjtgtWtQnzo=";
  };

  buildFlags = "-trimpath";

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  vendorSha256 = "sha256-YeQROdHdm/BHNlN4M8TG3IOWVGqjqx/CxgtrnUmcbrk=";
}
