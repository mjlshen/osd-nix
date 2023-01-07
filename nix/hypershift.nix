{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "hypershift";
  version = "4.12";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-M9q+OkWSvoK/yMNZ/MPU5s3kRehwVSw18lLLbH8lp9g=";
  };

  vendorSha256 = null;
  subPackages = [ "." ];
}
