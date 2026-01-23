{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "qtwebengine-5.15.19"
    ];
  };

  nixpkgs.overlays = [
    (final: prev: {
      supercollider = prev.supercollider.override {
        withWebengine = true;
      };
    })
  ];
}
