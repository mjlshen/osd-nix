{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "hypershift";
  version = "4.12";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-c8oWcX98T8+owFNhK1ccyRZ44HFAUyUclZqPIyYNjBQ=";
  };

  vendorSha256 = null;
  subPackages = [ "." ];
}
