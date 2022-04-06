{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "pd";
  version = "1.5.0";

  src = fetchFromGitHub {
    owner = "PagerDuty";
    repo = "go-pagerduty";
    rev = "v${version}";
    sha256 = "sha256-9chWmKqFSYL9pyu7umSnk6STjjhZuz/WgtgCZFsUdUc=";
  };

  vendorSha256 = "sha256-vqNUmkxuxklAlTJrGoVssH7OxjVJFRrNhGIMnC/urr0=";
  postInstall = ''
    mv $out/bin/command $out/bin/pd
  '';

  subPackages = [ "command" ];
}
