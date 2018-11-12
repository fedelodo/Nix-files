{ pkgs, ... }:
{

nixpkgs.config = {
  packageOverrides = pkgs: rec {
    polybar = pkgs.polybar.override {
      i3Support = true;
    };
  };
};


environment.systemPackages = with pkgs; [
	dmenu
	rofi
	nitrogen
	compton
	i3-gaps
	i3lock
	i3lock-fancy
	scrot
	unclutter
	neofetch
	termite
	networkmanagerapplet
	dunst
	lxappearance	
	adapta-gtk-theme
	gnome3.adwaita-icon-theme
	xorg.xcursorthemes
	spaceFM
	polybar
	xorg.xbacklight
	conky
	xorg.xev
	xdo
	xdotool
	xorg.xwininfo
];

fonts = {
	enableFontDir = true;
    	enableCoreFonts = true; # MS proprietary Core Fonts
	enableGhostscriptFonts = true;
	fonts = with pkgs; [
    		siji
		google-fonts
		powerline-fonts
		unifont
		font-awesome-ttf
		font-awesome_4
		font-awesome_5
		noto-fonts
	    	noto-fonts-cjk
	    	noto-fonts-emoji
	    	liberation_ttf
	    	fira-code
	    	fira-code-symbols
	    	mplus-outline-fonts
	    	dina-font
	    proggyfonts
	];
};

services.xserver = {
	windowManager = {
		i3.enable = true;
		i3.package = pkgs.i3-gaps;
	};
	desktopManager = {
		default = "none";
		xterm.enable = false;
	};
};
programs.dconf.enable = true;
services.dbus.packages = [pkgs.gnome3.dconf ];
}
