{ buildGo122Module, fetchFromGitHub }:

buildGo122Module rec {
  pname = "ocm";
  version = "0.1.76";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-obAbqp8pgh3qrJs120CWlvaOebtyqUBIoa9yV0ziUy4=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorHash = "sha256-uj4xmNZViag+j4YavFjDvc/ClMBb99DhwlcKzvGWQ7c=";

  subPackages = [ "cmd/ocm" ];
}
