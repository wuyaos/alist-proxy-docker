#!/bin/bash

#check domain and secret variables
if [[ -z "${ADDRESS}" || -z "${TOKEN}" ]]; then
    echo "Domain and secret cannot be empty!"
    exit 1
fi

exec /usr/local/bin/alist-proxy -address ${ADDRESS} -token ${TOKEN} -port ${PORT}
