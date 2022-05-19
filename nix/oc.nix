{ buildGo117Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo117Module rec {
  pname = "oc";
  # oc adm release info 4.10.13 --output=json | jq -r '.references.spec.tags[] | select (.name=="cli") | .annotations."io.openshift.build.commit.id"'
  version = "09f825e2ac8ddedf8bbc6bc82ffc5520560788a0";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "${version}";
    sha256 = "sha256-gZ0fiziZ4shry0uNL/KVXhiLApvthphylgOVI1oYj9g=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/oc/pkg/version.versionFromGit=4.10.13"
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
