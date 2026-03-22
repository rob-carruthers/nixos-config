{ config, pkgs, ... }:

# Assumes that dogecoin-qt is compiled at ~/repos/dogecoin/src/qt/dogecoin-qt
# (Helpers to compile are in ../scripts/dogecoin)

{
  home.packages = with pkgs; [
    qt5.qtbase
    qt5.qtwayland
  ];

  home.file."Desktop/dogecoin-qt-prune.desktop".text = ''
    [Desktop Entry]
    Name=Dogecoin Core
    Comment=Connect to the Dogecoin P2P Network
    Comment[de]=Verbinde mit dem Dogecoin peer-to-peer Netzwerk
    Comment[fr]=Dogecoin, monnaie virtuelle cryptographique pair à pair
    Comment[ru]=Подключиться к Dogecoin пиринговой сети
    Comment[tr]=Dogecoin, eşten eşe kriptografik sanal para birimi
    Terminal=false
    Exec=${config.home.homeDirectory}/repos/dogecoin/src/qt/dogecoin-qt --prune=2201 %u
    Type=Application
    Icon=${config.home.homeDirectory}/repos/dogecoin/src/qt/res/icons/dogecoin.png
    MimeType=x-scheme-handler/dogecoin;
    Categories=Office;
  '';
}
