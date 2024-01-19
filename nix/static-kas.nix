{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "static-kas";
  version = "765cd94436b832298af92a9c1749e7c4fe923406";

  src = fetchFromGitHub {
    owner = "alvaroaleman";
    repo = "static-kas";
    rev = "765cd94436b832298af92a9c1749e7c4fe923406";
    sha256 = "sha256-+X1+BastDxnHefDFQBO1yAkDH6CVREUnRxjgsS4qcj0=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-dpRTWIDLRNesJY5oDfDQBlL2mU0krjtMGqWGeZdMZqk=";

  # Rename binary to static-kas
  postInstall = ''
    mv $out/bin/main $out/bin/static-kas
  '';

  subPackages = [ "cmd/main.go" ];
}
