{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ocm";
  version = "0.1.63";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-wBKW2WS1+JmWOFCArmrlVfUTEqFYF7aq1OBrUo7e4ac=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-LyQ/F+E0y1gQtpGSyPEB2z2ImorA7mjY3QjrRORakIo=";

  subPackages = [ "cmd/ocm" ];
}
