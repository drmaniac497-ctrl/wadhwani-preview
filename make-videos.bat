@echo off
cd /d "%~dp0"
if not exist videos mkdir videos
powershell -NoProfile -ExecutionPolicy Bypass -Command "$f = Get-ChildItem -Path 'videos' -File | Where-Object { '.mp4','.webm','.m4v','.mov','.ogv' -contains $_.Extension.ToLower() } | Sort-Object Name; $items = $f | ForEach-Object { '  ' + ('videos/' + $_.Name | ConvertTo-Json) }; $body = $items -join ([string][char]44 + [char]10); [IO.File]::WriteAllText((Join-Path (Get-Location) 'videos.js'), 'window.VIDEOS = [' + [char]10 + $body + [char]10 + '];' + [char]10, (New-Object Text.UTF8Encoding $false)); Write-Host (($f | Measure-Object).Count) 'video(s) listed in videos.js'"
pause
