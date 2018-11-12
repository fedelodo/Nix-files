{pkgs, ...}:

with pkgs;
let
  python-packages = python-packages: with python-packages; [
     pycairo
      pygobject3
    # other python packages you want
  ]; 
  python = python3.withPackages python-packages;
in { 
environment.systemPackages = with pkgs; [
	python
	];
}
