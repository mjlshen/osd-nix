{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "hypershift";
  version = "4.11";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-NLJIvJMyRwT/FST1KDt/FdpylxxjCM7nWM78+GKq3Ss=";
  };

  vendorSha256 = null;
  subPackages = [ "." ];
}
