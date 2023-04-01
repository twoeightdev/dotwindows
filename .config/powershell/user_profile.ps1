# Prompt
# Set Powershell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Alias
Set-Alias vim nvim
Set-Alias v vim
Set-Alias ll ls

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Download video with yt-dlp
function dlv ([string]$UrlLink) {
    yt-dlp -S res,ext:mp4:m4a --recode mp4 "$UrlLink"
}

# Download audio only with yt-dlp
function dla ([string]$UrlLink) {
    yt-dlp -x --audio-format mp3 --audio-quality 0 "$UrlLink"
}

# Mpv
function svid ([string]$UrlLink) {
    mpv --profile=H60 "$UrlLink"
}
