with import <nixpkgs> {}; # bring all of Nixpkgs into scope

stdenv.mkDerivation rec {
  name = "endcord-1.2.0";
  buildCommand = ''
  '';
  src = builtins.fetchTarball {
    url = "https://github.com/sparklost/endcord/releases/download/1.1.4/${name}-linux.tar.gz";
    sha256 = "sha256:1kjwvgbn9413c4bl8gphm2n1ga3h3x51cqkngpban62381vpi62s";
  };
}
