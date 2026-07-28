#!/usr/bin/env bash
which sudo && export root="sudo" || root="run0 -i"
curl -sSf -L https://install.lix.systems/lix | sh -s -- install || $root "curl -sSf -L https://install.lix.systems/lix | sh -s -- install"
