# Show cfgs
function cfg-show
    echo -e "\033[0;33m cfg1:\033[1;36m NixOS"      #1
    echo -e "\033[0;33m cfg2:\033[1;36m i3wm"       #2
    echo -e "\033[0;33m cfg3:\033[1;36m kitty"      #3
    echo -e "\033[0;33m cfg4:\033[1;36m fish"       #4
    echo -e "\033[0;33m cfg5:\033[1;36m fastfetch"  #5
    echo -e "\033[0;33m cfg6:\033[1;36m flake.nix"  #6
    echo -e "\033[0;33m cfg7:\033[1;36m flake.lock"  #7
end

# Openall cfgs
function cfg-allopen
    kate -n /etc/nixos/configuration.nix /etc/nixos/home.nix /etc/nixos/flake.nix .config/i3/config .config/i3status-rust/config.toml
end

#1 NixOS
function cfg1
    kate -n /etc/nixos/configuration.nix
end
#2 i3wm
function cfg2
    kate -n /home/marcelb/.config/i3/config
end
#3 kitty
function cfg3
    kate -n /home/marcelb/.config/kitty/other.conf
end
#4 fish
function cfg4
    kate -n /home/marcelb/.config/fish/config.fish
end
#5 fastfetch
function cfg5
    kate -n /home/marcelb/.config/fastfetch/config.jsonc
end
#6 flake.nix
function cfg6
    kate -n /etc/nixos/flake.nix
end
#6 flake.lock
function cfg7
    kate -n /etc/nixos/flake.lock
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    cfg-show
end
