{ unstablePkgs, ... }:

{
  home.packages = [
    unstablePkgs.ruff
    unstablePkgs.ty
    unstablePkgs.uv
  ];

  home.file.".local/bin/uv-make-project".source = ./files/python/uv-make-project;

  xdg.configFile."uv/ruff.toml".source = ./files/python/ruff.toml;
  xdg.configFile."uv/ty.toml".source = ./files/python/ty.toml;
}
