#!/bin/sh
rm -rf build
mkdir build

docker run -v $PWD:/app -w /app -it google/dart sh -c 'dart pub get && dart compile exe main.dart -o build/bootstrap'

pushd build
zip function.zip bootstrap
popd

# to remove IDE errors
dart pub get