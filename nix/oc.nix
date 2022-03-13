{ buildGo117Module
, fetchFromGitHub
, gpgme
, libkrb5
, libassuan
, clang
}:

buildGo117Module rec {
  pname = "oc";
  version = "2125bdfd968c8eaf97e11ae93f8493e1602de5ef";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "oc";
    rev = "${version}";
    sha256 = "sha256-AgQXG44yCPmtbGNpJ99IicTnyGxgrsLLCRvvNgavs9A=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/oc/pkg/version.versionFromGit=${version}"
  ];

  tags = [
    "include_gcs" "include_oss" "containers_image_openpgp"
  ];

  vendorSha256 = null;

  buildInputs = [
    gpgme
    libassuan
    libkrb5
    clang
  ];

  subPackages = [ "cmd/oc" ];
}
