# Prompt
# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
# Import-Module oh-my-posh

# Load prompt config
$omp_config = Join-Path $PSScriptRoot ".\nu4a.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias v vim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Yt-dlp download video
function dlv ([string]$UrlLink) {
  yt-dlp -S res,ext:mp4:m4a --recode mp4 "$UrlLink"
}

# Yt-dlp download audio
function dla ([string]$UrlLink) {
  yt-dlp -x --audio-format mp3 --audio-quality 0 "$UrlLink"
}

# Mpv
function svid ([string]$UrlLink) {
  mpv --profile=H60 "$UrlLink"
}