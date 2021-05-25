function zsh {
    function config {
        case "$1" in
            "")
                $EDITOR "$HOME/.zshrc"
                ;;
            *)
                local MODULE_PATH="$HOME/.zsh/$1.zsh"
                if [[ -f "$MODULE_PATH" ]]; then
                    $EDITOR "$MODULE_PATHzsh"
                else
                    echo "ZSH module '$1 not found."
                fi
                ;;
        esac
        
    }

    case $1 in
        reload)
            exec $SHELL -l
            ;;
        config)
            shift
            config "$@"
            ;;
        *)
            command zsh "$@"
            ;;
    esac

    unfunction config
}

function unquarantine {
    xattr -d com.apple.quarantine $@
}
