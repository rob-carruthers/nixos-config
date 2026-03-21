{
  pkgs ? import <nixpkgs> { },
}:
with pkgs;
mkShell {
  nativeBuildInputs = [
    pkg-config
    autoreconfHook
    openssl
    db5
    util-linux
    boost
    zlib
    libevent
    miniupnpc
    libsForQt5.qtbase
    libsForQt5.qttools
    libsForQt5.qttools.dev
    protobuf
    qrencode
  ];
}
