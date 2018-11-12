let nixpkgs = import <nixpkgs> {};
in rec {
  fhsEnv = nixpkgs.buildFHSUserEnv {
    name = "fhs-matlab";
    targetPkgs = pkgs: [];
    multiPkgs = pkgs: (with pkgs; [
  		mesa_glu
    		ncurses
    		xorg.libXi
    		xorg.libXext
    		xorg.libXmu
    		xorg.libXp
    		xorg.libXpm
    		xorg.libXrandr
    		xorg.libXrender
    		xorg.libXt
    		xorg.libXtst
    		xorg.libXxf86vm
    		xorg.libX11
    		zlib
    		openjdk
		pam
    ]);
    runScript = "bash";
  };
}
