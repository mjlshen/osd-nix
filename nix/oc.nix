{ buildGo118Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo118Module rec {
  pname = "oc";
  # oc adm release info 4.11.0 --output=json | jq -r '.references.spec.tags[] | select (.name=="cli") | .annotations."io.openshift.build.commit.id"'
  version = "70750898e45ff4a349995b08e1d64a359e4c4880";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "${version}";
    sha256 = "sha256-sWVT+sCniXIgiQ60V+7sbIYQhF0b6GnymtHXEJ7sSDE=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/oc/pkg/version.versionFromGit=4.11.0"
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
