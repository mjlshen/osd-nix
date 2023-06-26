{ buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "hypershift";
  version = "4.13";

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "hypershift";
    rev = "release-${version}";
    sha256 = "sha256-cdlIVc0yF1PeXzFSIATVozz2FZB22JqqpifuiZcLRRQ=";
  };

  vendorSha256 = null;
  subPackages = [ "." ];
}
