#!/bin/bash

#check domain and secret variables
if [[ -z "${address}" || -z "${token}" ]]; then
    echo "Domain and secret cannot be empty!"
    exit 1
fi

exec /usr/local/bin/alist-proxy -${token} -${token} -port ${port}