#!/bin/bash

brew list --formula | xargs -I {} echo > brew_formulas.txt
brew list --casks | xargs -I {} echo > brew_casks.txt
