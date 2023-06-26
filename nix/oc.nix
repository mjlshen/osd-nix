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
    sha256 = "sha256-TpX9k5BsU1zN6WbtnERrmrJvWSo+DIUHRuiGU846dxg=";
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
