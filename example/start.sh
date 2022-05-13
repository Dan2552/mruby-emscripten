#!/usr/bin/env bash

set -e

script_dir=$( cd "$( dirname "$0" )" && pwd )

cd $script_dir

bundle
bundle exec mundle

MRUBY_PATH=$(bundle exec mundle path)

rm -rf ./build || :
mkdir build || :
mkdir build/mruby || :
mkdir build/emscripten || :
cp build_support/emscripten/app.html build/emscripten/app.html || :

bundle exec mundle exec mrbc \
  -g \
  -Bapp \
  -o./build/mruby/example.c \
  example.rb

cat build_support/boot.c >>build/mruby/example.c

emcc -O3 -v -s WASM=1 \
  -I $MRUBY_PATH/include \
  $MRUBY_PATH/build/wasm/lib/libmruby.a \
  -o build/emscripten/app.js \
  -s ASYNCIFY \
  -s ALLOW_MEMORY_GROWTH=1 \
  build/mruby/example.c

emrun build/emscripten/app.html
