# Package

version       = "4.1.5"
author        = "lyj"
description   = "Nim bindings for FLECS — a fast Entity Component System"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.2.8"
requires "futhark"           # only needed for regenerating bindings


# Tasks

task test, "Run all tests":
  exec "nim c -r --hints:off tests/tester.nim"

task testRelease, "Run tests in release mode":
  exec "nim c -d:release -r --hints:off tests/tester.nim"

task testDanger, "Run tests in danger mode":
  exec "nim c -d:danger -r --hints:off tests/tester.nim"

task testAsan, "Run tests with AddressSanitizer":
  exec "nim c -d:addressSanitizer -r --hints:off tests/tester.nim"
