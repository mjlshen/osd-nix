{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "rosa";
  version = "v1.2.7";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-QqYI9ar8a2Gyftbkw9WFz2+uDxkqsfPfepaFI1ZTuxk=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;

  subPackages = [ "cmd/rosa" ];
}
