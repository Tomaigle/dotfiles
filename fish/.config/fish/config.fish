if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    # Disabled
end

set -l foreground DCD7BA normal
set -l selection 2D4F67 brcyan
set -l comment 727169 brblack
set -l red C34043 red
set -l orange FF9E64 brred
set -l yellow C0A36E yellow
set -l green 76946A green
set -l purple 957FB8 magenta
set -l cyan 7AA89F cyan
set -l pink D27E99 brmagenta

set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

set -gx MANPAGER "nvim +Man!"
set -gx MANWIDTH 999
set -gx SUDO_EDITOR nvim
set -gx EDITOR nvim

abbr -a ld lazydocker
abbr -a lg lazygit
abbr -a ff fastfetch
abbr -a svim "sudo nvim"
abbr -a sedit "sudo edit"
abbr -a cp "cp -i"
abbr -a mv "mv -i"
abbr -a rm "trash -v"
abbr -a ping "ping -c 10"
abbr -a less "less -R"
abbr -a cls clear
abbr -a cat bat
abbr -a ls eza

abbr -a home "cd ~"
abbr -a cd.. "cd .."
abbr -a .. "cd .."
abbr -a ... "cd ../.."
abbr -a .... "cd ../../.."
abbr -a ..... "cd ../../../.."

abbr -a rmd "command rm --recursive --force --verbose"

abbr -a rebootsafe "sudo shutdown -r now"
abbr -a rebootforce "sudo shutdown -r -n now"

function cpg
    cp $argv
    if test -d $argv[-1]
        cd $argv[-1]
    end
end

function mvg
    mv $argv
    if test -d $argv[-1]
        cd $argv[-1]
    end
end

function mkdirg
    mkdir -p $argv[1]
    cd $argv[1]
end

zoxide init --cmd cd fish | source
