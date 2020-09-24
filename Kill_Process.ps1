$obj = Read-Host -Prompt "Input process"

$obj = Get-Process $obj -ErrorAction SilentlyContinue
if ($obj) {
  # try gracefully first
  $obj.CloseMainWindow()
  # kill after five seconds
  Sleep 5
  if (!$obj.HasExited) {
    $obj | Stop-Process -Force
  }
}
