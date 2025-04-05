#!/usr/bin/bash

TARGET_DIR=${PWD}
SOURCE_DIR=$(dirname $(readlink -f $0))

mkdir ./src
mkdir ./src/include
touch ./src/main.c
mkdir ./doc
mkdir ./bin
mkdir ./test
touch ./test/main.c
mkdir ./test/bin
touch ./README.md

cp ${SOURCE_DIR}/templates/makefile.template ${TARGET_DIR}/makefile
cp ${SOURCE_DIR}/templates/main.c.template ${TARGET_DIR}/src/main.c
cp ${SOURCE_DIR}/templates/main.c.template ${TARGET_DIR}/test/main.c
cp ${SOURCE_DIR}/templates/gitignore.template ${TARGET_DIR}/.gitignore

git init
git add .
git commit -m "initial structure"

# HACK:
# calling make just to call bear and generate compile_flags.json
make all
