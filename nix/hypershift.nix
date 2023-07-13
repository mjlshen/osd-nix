{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "hypershift";
  version = "4.13";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-HQ5NpHS2NJ6PvF+XZSmCh58kzxF3/h9UwuK0LKgYDmY=";
  };

  vendorSha256 = null;
  subPackages = [ "." ];
}
