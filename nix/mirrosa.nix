{ buildGo121Module, fetchFromGitHub }:

buildGo121Module rec {
  pname = "mirrosa";
  version = "0.0.9";

  src = fetchFromGitHub {
    owner = "mjlshen";
    repo = "mirrosa";
    rev = "v${version}";
    sha256 = "sha256-8yfMvJfL0eYHOqbAWTFnaJaQHfXS/YHMq4yX+EIdlrM=";
  };

  CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  vendorSha256 = "sha256-OdyIBE7/jCQvNw0sZ2qubVPSTFct2bmiOwrX5YaosuQ=";
}
