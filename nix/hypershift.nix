{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "hypershift";
  version = "4.13";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-MeQ1vNi0obWeEagPQxc4Lris4NGSVEoN6X1hukSV0kk=";
  };

  vendorSha256 = null;
  subPackages = [ "." ];
}
