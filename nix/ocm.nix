{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ocm";
  version = "0.1.64";

  src = fetchFromGitHub {
    owner = "openshift-online";
    repo = "ocm-cli";
    rev = "v${version}";
    sha256 = "sha256-RMXiEXgf8tAdp2d97kaOzXgFCFVkaMhkJF8AHXIEJm8=";
  };

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-4m5Ej2Ql9+wGqrzvXQkY8fL2I9tYE6Tm6s9+qcZBHQI=";

  subPackages = [ "cmd/ocm" ];
}
