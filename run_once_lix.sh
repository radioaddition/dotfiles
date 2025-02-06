#!/usr/bin/env bash
which sudo && curl -sSf -L https://install.lix.systems/lix | sh -s -- install || run0 sh -c "curl -sSf -L https://install.lix.systems/lix | sh -s -- install"
