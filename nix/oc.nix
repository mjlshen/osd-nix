{ buildGo122Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo122Module rec {
  pname = "oc";
  version = "4.17";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "release-${version}";
    sha256 = "sha256-MWMwRCQ2ATUn14gqsJ+uniBUux0AoaPB1WYZJ7XMieY=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/oc/pkg/version.versionFromGit=${version}.0"
  ];

  tags = [
    "include_gcs" "include_oss" "containers_image_openpgp"
  ];

  vendorHash = null;

  buildInputs = [
    gpgme
    libassuan
    libkrb5
  ];

  subPackages = [ "cmd/oc" ];
}
