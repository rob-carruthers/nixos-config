{
  pkgs,
  fenix,
  system,
}:

let
  toolchain = fenix.packages.${system}.stable.withComponents [
    "rustc"
    "cargo"
    "clippy"
    "rustfmt"
    "rust-src"
  ];
in
pkgs.mkShell {
  packages = [
    toolchain
    fenix.packages.${system}.rust-analyzer
  ];

  RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";

  shellHook = ''
    export PATH="$HOME/.cargo/bin:$PATH"
  '';
}
