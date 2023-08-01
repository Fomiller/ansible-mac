#!/bin/bash

var_file="${1:./group_vars/all.yml}"

brew list --formula | xargs -I @ yq '.brew_formulas += ["@"]' -i $var_file
brew list --casks | xargs -I @ yq '.brew_casks += ["@"]' -i $var_file
