
{ config, pkgs, ... }:
{ 
  hardware = {
    opengl.driSupport32Bit = true; # needed for steam and/or wine, i believe
  };

  services = {
    udisks2.enable = true;
    acpid.enable = true;
    thermald.enable = true;
    teamviewer.enable = true;
    redshift = {
      enable = true;
      latitude = "45";
      longitude = "9";
      temperature = {
        day = 6500;
        night = 3400;
      };
      brightness = {
        day = "1.0";
        night = "0.7";
      };
    };
    tlp = {
     enable = true;
    };
  };

  systemd.services.battery_check = {
    description = "Send notification if battery is low";
    serviceConfig = {
      Type = "oneshot";
      User = "anders";
      ExecStart = pkgs.writeScript "battery_check" ''
        #!${pkgs.bash}/bin/bash --login
        . <(udevadm info -q property -p /sys/class/power_supply/BAT0 |
            grep -E 'POWER_SUPPLY_(CAPACITY|STATUS)=')
        if [[ $POWER_SUPPLY_STATUS = Discharging && $POWER_SUPPLY_CAPACITY -lt 15 ]];
        then notify-send -u critical "Battery is low: $POWER_SUPPLY_CAPACITY";
        fi
      '';
     };
    environment = { DISPLAY = ":${toString config.services.xserver.display}"; };
    after = [ "display-manager.service" ];
    startAt = "*:00/5";
    };
  
    environment.systemPackages = with pkgs; [
     powertop
     jq
 ];
}
