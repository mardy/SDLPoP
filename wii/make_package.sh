#! /bin/sh

set -e

NAME=prince
TMPDIR="$(mktemp -d)"
OUTDIR="$TMPDIR/$NAME"
SRCDIR="$(pwd)"

mkdir -p "$OUTDIR"
cp -a \
    data/ \
    wii/meta.xml \
    wii/icon.png \
    wii/gamecontrollerdb.txt \
    wii/SDLPoP.ini \
    "$OUTDIR"
elf2dol "$NAME.elf" "$OUTDIR/boot.dol"

cd $TMPDIR
zip -r "$NAME.zip" "$NAME"
cd -
mv "$TMPDIR/$NAME.zip" .
rm -rf "$TMPDIR"
