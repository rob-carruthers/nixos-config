{
  legion-kb-rgb,
}:

[
  (final: prev: {
    legion-kb-rgb = legion-kb-rgb.packages.${final.stdenv.hostPlatform.system}.default;
  })

  (import ../overlays/memphis98.nix)
  (import ../overlays/ch57x-keyboard-tool.nix)
]
