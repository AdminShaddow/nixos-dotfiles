with import <nixpkgs> {}; # bring all of Nixpkgs into scope

stdenv.mkDerivation rec {
  name = "endcord-1.2.0";
  buildCommand = ''
  '';
  src = builtins.fetchTarball {
    url = "https://github.com/sparklost/endcord/releases/download/1.2.0/${name}-linux.tar.gz";
    sha256 = "sha256:0xr42rndbbznwxry7k01dnw05fi7szmckqn1zvj8bbbvw1hrjpvj";
  };
}
