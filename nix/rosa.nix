{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "rosa";
  version = "v1.2.6";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "rosa";
    rev = "${version}";
    sha256 = "sha256-VZPGjRsigw7FIqVdOT97wWWpR0jkk4miixEpJaNBZ2E=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = null;

  subPackages = [ "cmd/rosa" ];
}
