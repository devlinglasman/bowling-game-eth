#!/usr/bin/env bash

set -eo pipefail

# import the deployment helpers
. $(dirname $0)/common.sh

# Deploy.
BowlingGameAddr=$(deploy BowlingGame)
log "BowlingGame deployed at:" $BowlingGameAddr
