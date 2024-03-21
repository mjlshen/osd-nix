{ buildGo120Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo120Module rec {
  pname = "oc";
  version = "4.15";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "release-${version}";
    sha256 = "sha256-WgR9te7uHq6wJyeJUWDYk+mkNON7P0c+LkZCKtHatJo=";
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
