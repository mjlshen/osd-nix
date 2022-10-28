{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "osdctl";
  version = "0.13.2";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-LQmsxa0IyZ8cLoRMlKk6HKR7dLDrIZz7XCg1I9ET78M=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/cmd.GitCommit=${src.rev}"
    "-X github.com/openshift/osdctl/cmd.Version=v${version}"
  ];

  vendorSha256 = "sha256-WIQEiNW8WvTu3uNt7qmBkW+Hci6VALQZdYYwA7Epl3A=";
}
