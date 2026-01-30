final: prev:
let
  pname = "ch57x-keyboard-tool";
  version = "1.7.0";
in
{
  ch57x-keyboard-tool = final.rustPlatform.buildRustPackage {
    inherit pname version;

    src = final.fetchFromGitHub {
      owner = "kriomant";
      repo = "ch57x-keyboard-tool";
      rev = "v${version}";
      hash = "sha256-SM5hOiwVbji5Qo+sn0rLST0IQEhIhJHXbajEcg2IqXk=";
    };

    cargoHash = "sha256-ojQ9tiN9H7xYFdunYTjj93QX7d/ZJDtrtqg56B27ysU";

    meta = with final.lib; {
      description = "Utility for programming CH57X macro keyboards";
      homepage = "https://github.com/kriomant/ch57x-keyboard-tool";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };
}
