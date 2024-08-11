{ buildGo121Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo121Module rec {
  pname = "oc";
  version = "4.16";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "release-${version}";
    sha256 = "sha256-zHgGid36JCMIYmsfWQ7pUWZQTyBowRjt5GLQNmFlNDY=";
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
