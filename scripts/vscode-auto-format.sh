if [ ! -d ./.git ]; then
    echo "Not a git repo";
    return 0;
fi

if [ ! -d ./.vscode ]; then
    mkdir -p .vscode
fi

if [ ! -f ./.vscode/settings.json ]; then
    cat << EOF > ./.vscode/settings.json
    {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "esbenp.prettier-vscode",
        "[javascript]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode"
        },
        "[typescript]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode"
        }
    } 
EOF
    exit 1;
fi

if [ cat ./.vscode/settings.json | jq '."editor.formatOnSave"' ]; then
    echo "Previous settings found. Script exiting";
fi