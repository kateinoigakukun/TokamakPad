#!/bin/bash

set -eu
scripts_dir="$(cd "$(dirname $0)" && pwd)"
toolchain_dir="$scripts_dir/../.toolchain"

export SWIFT_TAG=$(cat $scripts_dir/../.swift-version)

case $(uname -s) in
  Darwin)
    export PLATFORM_TOOLCHAIN_DIR="$toolchain_dir/darwin"
  ;;
  Linux)
    export PLATFORM_TOOLCHAIN_DIR="$toolchain_dir/linux"
  ;;
  *)
    echo "Unrecognised platform $(uname -s)"
    exit 1
  ;;
esac

export TOOLCHAIN="$HOME/Library/Developer/Toolchains/swift-wasm-5.3.1-RELEASE.xctoolchain"
