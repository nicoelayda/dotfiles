function zsh {
    function config {
        case "$1" in
            "")
                $EDITOR "$HOME/.zshrc"
                ;;
            *)
                local MODULE_PATH="$HOME/.zsh/$1.zsh"
                if [[ -f "$MODULE_PATH" ]]; then
                    $EDITOR "$MODULE_PATH"
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

# encode base 64 string
function b64encode() {
    b64string=$(echo -n "$@" | base64)
    echo -n $b64string | pbcopy
    echo "Copied to clipboard"
}

# decode base 64 string
function b64decode() {
    plaintext=$(echo -n "$@" | base64 -d)
    echo -n $plaintext | pbcopy
    echo "Copied to clipboard"
}
