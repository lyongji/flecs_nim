## Flecs — complete module (import everything).
##
## Convenience import that pulls in all modules at once.
## For smaller imports, import specific modules:
##   import flecs/core
##   import flecs/meta
##   etc.

import raw
import core

# Addon modules — available as opt-in submodules
import meta
import json
import http
import script
import alerts
import stats
import app

# High-level Nim-style API (opt-in: `import flecs/high`)
# Not auto-exported to keep the namespace clean.
# import high

export raw
export core
export meta
export json
export http
export script
export alerts
export stats
export app
