#! /usr/bin/env bash

for file in $(find ./provision -name '*.sh'); do
    bash -n $file
done
