{ lib, stdenv, makeWrapper, fetchzip, bash, steam-run }:

stdenv.mkDerivation rec {
  pname = "optcg-sim";
  version = "1.32a";

  src = fetchzip {
    url = "https://archive.org/download/optcgsim-1.32a-linux/OPTCGSIM-1.32a_Linux.zip";
    sha256 = "0f7v04f0pkhk4ha1yrjcbi6fz4dmc80vi0jrjmw20q7wnfjjsnrw";
    stripRoot = true;
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -d $out/opt/OPTCGSim
    cp -a ./* $out/opt/OPTCGSim/
    chmod +x $out/opt/OPTCGSim/OPTCGSim.x86_64

    install -d $out/libexec
    substitute ${./optcg-sim-run.in} $out/libexec/optcg-sim-run \
      --subst-var-by bash ${bash} \
      --subst-var-by steamrun ${steam-run}/bin/steam-run \
      --subst-var-by out $out
    chmod +x $out/libexec/optcg-sim-run

    install -d $out/bin
    ln -s $out/libexec/optcg-sim-run $out/bin/optcg-sim

    install -d $out/share/applications
    cat > $out/share/applications/optcg-sim.desktop <<EOF
  [Desktop Entry]
  Name=OPTCG Sim
  Exec=optcg-sim
  Icon=optcg-sim
  Type=Application
  Categories=Game;
  EOF

    install -d $out/share/icons/hicolor/256x256/apps
    install -m644 OPTCGSim_Data/Resources/UnityPlayer.png \
      $out/share/icons/hicolor/256x256/apps/optcg-sim.png

    runHook postInstall
  '';

  meta = with lib; {
    description = "One Piece TCG Simulator";
    homepage = "https://linktr.ee/maebatsu";
    license = licenses.unfreeRedistributable;
    platforms = platforms.linux;
    mainProgram = "optcg-sim";
  };
}
