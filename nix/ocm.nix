{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.65";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-UzHGVK/HZ5eH8nO4+G92NunOQi9AWnqv4vgcHjtoPDw=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-4pqXap1WayqdXuwwLktE71D7x6Ao9MkIKSzIKtVyP84=";

  subPackages = [ "cmd/ocm" ];
}
