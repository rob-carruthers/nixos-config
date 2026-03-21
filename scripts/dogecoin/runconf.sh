./configure \
--with-incompatible-bdb \
--with-gui \
--with-boost=$(nix eval --raw nixpkgs#boost.outPath) \
--with-boost-libdir=$(nix eval --raw nixpkgs#boost.outPath)/lib \
LRELEASE=$(which lrelease) \
LUPDATE=$(which lupdate) \
CXXFLAGS="-std=gnu++17"
