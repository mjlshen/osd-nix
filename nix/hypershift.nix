{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "hypershift";
  version = "4.15";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-BDsYVB0vTltTu1Oevtj1CzFrb7iRMBFETH/AfcUT1rU=";
  };

  vendorHash = null;
  subPackages = [ "." ];
}
