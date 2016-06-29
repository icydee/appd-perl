#!/bin/sh

#set -x

# Where is the SDK installed
APPD_SDK=/home/stevew/AppDynamics/appdynamics-sdk-native/sdk_lib

# clean
rm *.o *.so *wrap.c *.pm > /dev/null 2>&1

#get flags used to compile Perl
PERL_INC=$(perl -e 'use Config; print "$Config{archlib}\n";')/CORE
CFLAGS=$(perl -MConfig -e "print \$Config{ccflags}")
CFLAGS="-fPIC -I $APPD_SDK -I$PERL_INC $CFLAGS"

# swig generates the wrapper code
swig -perl5 appd.i

echo "CFLAGS"
echo "$CFLAGS"
gcc $CFLAGS -c proxy.c appd_wrap.c

echo "Linking..."
ld -G -L $APPD_SDK/lib proxy.o appd_wrap.o -o appd.so -lappdynamics_native_sdk

