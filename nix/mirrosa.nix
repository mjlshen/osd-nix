{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "mirrosa";
  version = "0.0.6";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-tV1rta2os4iP+Yl5weLcX5NOaale7/n7Ea9mckYg148=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-ztjUCFPQZv1Juc2INAYoXsl5eb8boyPtQNm4Mh4Ll4Q=";
}
