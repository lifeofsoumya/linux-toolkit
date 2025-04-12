#!/bin/bash

# -----------------------------------------------------------------------------
# install.sh
# Linux Toolkit adds custom aliases and functions to the .bashrc file.
# Author: Soumya Mondal
# URL: https://nated.in/tk/install.sh
# Github: https://github.com/lifeofsoumya/linux-toolkit
# -----------------------------------------------------------------------------

CODE="
# linux toolkit - custom aliases and functions
alias ll='ls -la'
alias gs='git status'
alias gc='git commit -m'
alias gca='git commit -a -m'  # Commit all changes with message
alias python='python3'
alias pip='pip3'

rungo () {
    if [ \$# -eq 0 ]; then
        nodemon --exec go run main.go --signal SIGTERM
    elif [ \$# -eq 1 ]; then
        nodemon --exec go run '\$1' --signal SIGTERM
    fi
}

pyserve () {
    python -m http.server '\$1'
}

venv() {
    if [[ "$VIRTUAL_ENV" != "" ]]; then
        echo "🛑 Deactivating virtual environment: $VIRTUAL_ENV"
        deactivate
        return 0 2>/dev/null || exit 0
    fi

    if [ -d "venv" ]; then
        echo "⚡ Activating existing virtual environment..."
    else
        echo "✨ Creating new virtual environment..."
        python -m venv venv
    fi

    source venv/bin/activate
}

docker_run () {
    docker build -t '\$1' . && docker run -it --rm '\$1'
}

docker_cleanup () {
    docker container prune -f && docker image prune -f
}

sys_info () {
    echo 'CPU Info:'
    lscpu | grep 'Model name'
    echo ''
    echo 'Memory Info:'
    free -h
}

npkill () {
    npx npkill
}

clean_node_modules () {
    rm -rf node_modules
    rm package-lock.json yarn.lock
    npm install || yarn install
}

clear_npm_cache () {
    npm cache clean --force
}

disk_usage () {
    df -h
}

largest_files () {
    du -ah . | sort -rh | head -n 10
}

ltk() {
    echo "🧰 Available Linux Toolkit Commands:"
    echo
    echo "Aliases:"
    echo "  ll                  - List all files and directories with details"
    echo "  gs                  - Git status"
    echo "  gc                  - Git commit with a message"
    echo "  gca                 - Git commit all changes with a message"
    echo "  python              - Alias for python3"
    echo "  pip                 - Alias for pip3"
    echo
    echo "Functions:"
    echo "  venv                - Toggle Python virtual environment (create/activate/deactivate)"
    echo "  rungo [file]        - Run Go file using nodemon (defaults to main.go if no arg)"
    echo "  pyserve [port]      - Serve current directory over HTTP using Python"
    echo "  docker_run <name>   - Build and run a Docker image interactively"
    echo "  docker_cleanup      - Remove dangling Docker containers and images"
    echo "  sys_info            - Display CPU and memory info"
    echo "  npkill              - Open npkill for cleaning node_modules folders"
    echo "  clean_node_modules  - Delete node_modules and lock files, then reinstall"
    echo "  clear_npm_cache     - Clear npm cache forcefully"
    echo "  disk_usage          - Show disk usage in human-readable format"
    echo "  largest_files       - Show 10 largest files/directories in current directory"
    echo "  linux-tk            - List all toolkit commands with descriptions"
}

export -f rungo pyserve docker_run docker_cleanup sys_info npkill clean_node_modules clear_npm_cache disk_usage largest_files ltk
"

if ! grep -q "linux toolkit - custom aliases and functions" ~/.bashrc; then
    echo "$CODE" >> ~/.bashrc
    echo "The custom functions and aliases have been added to your .bashrc file."
else
    echo "The custom functions and aliases are already in your .bashrc file."
fi

source ~/.bashrc
echo "The changes have been applied. You can now use the new aliases and functions."
