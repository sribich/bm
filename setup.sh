#!/usr/bin/env bash
##
## Author: Stephen Ribich <stephen@ribich.dev>
## URL:    https://github.com/sribich/bm
##
##  /$$$$$$$   /$$      /$$
## | $$__  $$ | $$$    /$$$
## | $$  \ $$ | $$$$  /$$$$
## | $$$$$$$  | $$ $$/$$ $$
## | $$__  $$ | $$  $$$| $$
## | $$  \ $$ | $$\  $ | $$
## | $$$$$$$/ | $$ \/  | $$
## |_______/  |__/     |__/
##
##       bash modules
##
## License: MIT
##
BPM_BRANCH="master"
BPM_REMOTE="https://github.com/sribich/bm"
BPM_ARCHIVE="${BPM_REMOTE}/archive/${BPM_BRANCH}.tar.gz"

BPM_TMP="$(mktemp -d)" || exit 1
BPM_EUID="$(id -u)"

##
##
##
set_prefix()
{
    if [[ -n "${PREFIX}" && ${PREFIX} != "" && "${PREFIX}" != "/" ]]; then
        return
    fi

    if [[ "${BPM_EUID}" -eq 0 ]]; then
        PREFIX="/usr/local"
    fi

    PREFIX="${HOME}/.local"
}

download_archive()
{
    if command -v wget 1>/dev/null 2>&1; then
        wget -O "${BPM_TMP}/archive.zip" "${BPM_ARCHIVE}"
    elif command -v curl 1>/dev/null 2>&1; then
        curl -fsLo "${BPM_TMP}/archive.zip" "${BPM_ARCHIVE}"
    else
        printf "This script requires either curl or wget to be installed\n" 1>&2
        exit 1
    fi

    if ! command -v tar 1>/dev/null 2>&1; then
        printf "This script requires unzip to be installed\n" 1>&2
        exit 1
    fi

    cd "${BPM_TMP}" || exit 1

    tar -zxvf "${BPM_TMP}/archive.zip"
}

install_archive()
{
    cd "${BPM_TMP}/bpm-${BPM_BRANCH}" || exit 1

    if [[ -d "${PREFIX}/lib/bpm" ]]; then
        rm -rf "${PREFIX}/lib/bpm"
    fi

    mkdir -p "${PREFIX}/bin"
    mkdir -p "${PREFIX}/lib/bpm/bin"
    mkdir -p "${PREFIX}/lib/bpm/lib"

    mv "${BPM_TMP}/bpm-${BPM_BRANCH}/bin" "${PREFIX}/lib/bpm"
    # mv "${BPM_TMP}/bpm-${BPM_BRANCH}/lib" "${PREFIX}/lib/bpm/lib"

    ln -fs "${PREFIX}/lib/bpm/bin/bpm" "${PREFIX}/bin/bpm"
}

main()
{
    set_prefix

    download_archive
    install_archive
}

main "$@"




# unzip -d "$dest" "$zip" && f=("$dest"/*) && mv "$dest"/*/* "$dest" && rmdir "${f[@]}"
