{ buildGo119Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo119Module rec {
  pname = "oc";
  version = "4.13";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "release-${version}";
    sha256 = "sha256-qYcT3d+TiYhtPWdD8XvChNMchiMmuFaIi2CDVM6vkG4=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/oc/pkg/version.versionFromGit=${version}.0"
  ];

  tags = [
    "include_gcs" "include_oss" "containers_image_openpgp"
  ];

  vendorSha256 = null;

  buildInputs = [
    gpgme
    libassuan
    libkrb5
  ];

  subPackages = [ "cmd/oc" ];
}
