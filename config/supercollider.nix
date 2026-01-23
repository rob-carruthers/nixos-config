{
  nixpkgs.overlays = [
    (final: prev: {
      supercollider = prev.supercollider.override {
        withWebengine = true;
      };
    })
  ];
}
