{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "ocm";
  version = "0.1.74";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-sORCttAeLmC1Ab4LmdQaYHA9nWDx+pN6rcts+xVHXFY=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-hYNSOzXgXwNTwJywPyFktDp5NA1ROKZtSjMsDdz7nSg=";

  subPackages = [ "cmd/ocm" ];
}
