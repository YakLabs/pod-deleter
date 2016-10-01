#!/bin/bash
set -e
set -x
NAME=`basename ${PWD}`
VERSION=`git rev-parse --short HEAD`

docker build -t ${NAME}:${VERSION} .

for SERVER in quay.io; do
    for T in ${VERSION} latest; do
        REPO=${SERVER}/${NAME}:${T}
        docker tag -f ${NAME}:${VERSION} ${REPO}
        docker push ${REPO}
    done
done
