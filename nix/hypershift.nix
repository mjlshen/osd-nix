{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "hypershift";
  version = "4.12";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-VGvQIP/h5/HR1pIG4E6aZEHNQNCoQCqdCNWaliKpdGE=";
  };

  vendorSha256 = null;
  subPackages = [ "." ];
}
