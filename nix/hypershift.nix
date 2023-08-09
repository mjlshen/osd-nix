{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "hypershift";
  version = "4.13";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-DP4wbhzlwFNG7VsJ2Jx2xPd4sZTQUh6jhVoVtJ6djes=";
  };

  vendorSha256 = null;
  subPackages = [ "." ];
}
