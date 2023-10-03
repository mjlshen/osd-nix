{ buildGo120Module, fetchFromGitHub }:

buildGo120Module rec {
  pname = "osdctl";
  version = "0.19.1";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "osdctl";
    rev = "v${version}";
    sha256 = "sha256-tbx/WIFbjqPHp9ZgrzSmbkfBkhTr3CxdeNd7fXpQxn4=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/osdctl/pkg/utils.Version=${version}"
  ];

  vendorSha256 = "sha256-qXjCCa4jgl+RkWqC1z+fM64Z+QTEAojkS1Myfg5fxEk=";
  doCheck = false;
}
