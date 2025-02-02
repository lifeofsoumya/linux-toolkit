#!/bin/bash

rungo () {
    if [ $# -eq 0 ]; then
        nodemon --exec go run main.go --signal SIGTERM
    elif [ $# -eq 1 ]; then
        nodemon --exec go run "$1" --signal SIGTERM
    fi
}

pyserve () {
    python -m http.server "$1"
}

docker_run () {
    docker build -t "$1" . && docker run -it --rm "$1"
}

docker_cleanup () {
    docker container prune -f && docker image prune -f
}

sys_info () {
    echo "CPU Info:"
    lscpu | grep 'Model name'
    echo ""
    echo "Memory Info:"
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

code_here () {
    code .
}

disk_usage () {
    df -h
}

largest_files () {
    du -ah . | sort -rh | head -n 10
}

export -f rungo pyserve docker_run docker_cleanup sys_info npkill clean_node_modules clear_npm_cache code_here disk_usage largest_files
