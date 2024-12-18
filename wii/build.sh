#! /bin/bash

CONSOLE=wii

source /etc/profile.d/devkit-env.sh
source "$DEVKITPRO/${CONSOLE}vars.sh"
export PKG_CONFIG_PATH=$($DEVKITPRO/portlibs_prefix.sh $CONSOLE)/lib/pkgconfig/:$PORTLIBS_PPC/lib/pkgconfig

cd src
make \
    CC="$CC" \
    CPPFLAGS="$CPPFLAGS" \
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS -L$DEVKITPRO/libogc/lib/$CONSOLE" \
    LIBS="$(pkg-config --static --libs sdl2 SDL2_image)" \
    BIN="../prince.elf"
cd -

