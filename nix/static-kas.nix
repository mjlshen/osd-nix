{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "static-kas";
  version = "e5b1ae53afe5bc6cf279f91e985aecfe19590804";

  src = fetchFromGitHub {
    owner = "alvaroaleman";
    repo = "static-kas";
    rev = "e5b1ae53afe5bc6cf279f91e985aecfe19590804";
    sha256 = "sha256-XCKoDDtaotcWFPQqGfUdzeTAv6GO0qIxXkSC+kJGiak=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-WJbR8D2YIwxSvMiy4KgfMvmEbjanh/9Eyedfj94I/p8=";

  # Rename binary to static-kas
  postInstall = ''
    mv $out/bin/main $out/bin/static-kas
  '';

  subPackages = [ "cmd/main.go" ];
}
