import std/os

proc fatal(msg: string) = quit "FAILURE " & msg

proc exec(cmd: string) =
  echo "Running: ", cmd
  if execShellCmd(cmd) != 0: fatal cmd

let testDir = getCurrentDir() / "tests"
for f in walkFiles(testDir / "t*.nim"):
  let name = f.extractFilename
  if name == "tester.nim":
    continue
  exec "nim c -r --hints:off " & quoteShell(testDir / name)

echo "All test files completed."
