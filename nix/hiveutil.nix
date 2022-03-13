{ buildGo117Module, fetchFromGitHub }:

buildGo117Module rec {
  pname = "hiveutil";
  version = "133480feffd6c4bbce011c793a85b0f3e700d585";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hive";
    rev = "${version}";
    sha256 = "sha256-h74rIQfF2g1EwsQb2878hWRtC7WWz6QYTKLgNnhQtHY=";
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/openshift/hive/pkg/version.versionFromGit=${version}"
  ];

  tags = [
    "trimpath"
  ];

  vendorSha256 = "sha256-cLnf/QR/FlpikkWGkDpwz3R3UR3iV5WRTYN+7JfNZcw=";

  subPackages = [ "contrib/cmd/hiveutil" ];
}
