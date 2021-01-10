#!/usr/bin/env bash

pkg.link() {
    [ -d "$PKG_PATH/files" ] && fs.link_files files
}

pkg.install() {
    # Install Docker Desktop
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC" "$PKG_PATH"

    # Indicate a restart is needed and exit all installations.
    echo "" && echo "Please restart the computer and then run 'ellipsis pull desktop-work' from a WSL prompt to continue the installation." &&
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
