#!/bin/bash

if [ -d "iproute2" ]; then
    echo "> iproute2 already exists"
else
    git clone https://github.com/shemminger/iproute2.git
    cd iproute2
    ./configure
    cd ..
fi

cp q_bundle_inbox.c iproute2/tc/
cd iproute2
make TCSO=q_bundle_inbox.so
echo "TC_LIB_DIR=$pwd/tc"
