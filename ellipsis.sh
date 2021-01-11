#!/usr/bin/env bash

pkg.link() {
    [ -d "$PKG_PATH/files" ] && fs.link_files files
}

pkg.install() {
    # Install Docker Desktop
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC" "$PKG_PATH"

    # Indicate a restart is needed and exit all installations.
    echo "" && echo -e "\e[33mPlease restart the computer and then run \"\e[0mellipsis pull desktop-work\e[33m\" from a WSL prompt to continue the installation.\e[0m" &&
    exit 1
}

pkg.pull() {
    # Check for updates on git
    git remote update 2>&1 > /dev/null
    if git.is_behind; then
        # Unlink old files
        hooks.unlink

        # Pull package changes
        git.pull

        # Link new files
        pkg.link
    fi

    # Update Docker Desktop
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC" "$PKG_PATH"
}

pkg.uninstall() {
    # Remove PhpStorm
    bash $PKG_PATH/uninstall.sh "$ELLIPSIS_SRC"
}
