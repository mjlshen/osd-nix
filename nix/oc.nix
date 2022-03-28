{ buildGo117Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo117Module rec {
  pname = "oc";
  # oc adm release info 4.10.5 --output=json | jq -r '.references.spec.tags[] | select (.name=="cli") | .annotations."io.openshift.build.commit.id"'
  version = "6db43e22ecffd58dbd1cfb3b245967bde98f9a66";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "${version}";
    sha256 = "sha256-tf0clu7Kz9VJb7GSkhDBvskeyedtV1SynarJYjtNFAw=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/oc/pkg/version.versionFromGit=4.10.5"
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
