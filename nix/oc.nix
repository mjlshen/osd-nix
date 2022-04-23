{ buildGo117Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo117Module rec {
  pname = "oc";
  # oc adm release info 4.10.10 --output=json | jq -r '.references.spec.tags[] | select (.name=="cli") | .annotations."io.openshift.build.commit.id"'
  version = "3e24949fea37244367d50a1f3a226ec20d51eef1";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "${version}";
    sha256 = "sha256-ruPw14kwIaGN5EDWH5NHgNYdt9jpBmQTc7VITaFgYXA=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/oc/pkg/version.versionFromGit=4.10.10"
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
