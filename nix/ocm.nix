{ buildGo122Module, fetchFromGitHub }:

buildGo122Module rec {
  pname = "ocm";
  version = "0.1.75";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-ckAj0iMl0e2iNpEoR3HF00HzxQHG2afJ1JQ6rqiXwZQ=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorHash = "sha256-ghhEphMjJz6ztGnaA6ajXxvMAKJOBcGcdQvEvX/xIi0=";

  subPackages = [ "cmd/ocm" ];
}
