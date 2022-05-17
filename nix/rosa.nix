{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "rosa";
  version = "v1.2.2";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-4FOPOcgTT7KwhfEPjZh8XrL45yqt3khO2EMf2eqPJAI=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;

  subPackages = [ "cmd/rosa" ];
}
