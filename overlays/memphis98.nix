final: prev: {
  memphis98 = prev.stdenv.mkDerivation {
    pname = "Memphis98";
    version = "1.0.0";

    src = prev.fetchFromGitHub {
      owner = "Stanton731";
      repo = "Memphis98";
      rev = "2d7bb51";
      sha256 = "sha256-Xn17X1NSbm0E5XhCLQTd6aiKrm8XJ3mfMoanlgP1rVc=";
    };

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/icons
      cp -r . $out/share/icons/Memphis98
      runHook postInstall
    '';
  };
}
