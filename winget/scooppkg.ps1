TRY
{
    scoop --version
}
Catch
{
    iwr -useb get.scoop.sh | iex
}

scoop update
scoop bucket add extras
scoop bucket add versions
scoop install geekuninstaller
scoop install lua
scoop install curl
scoop install ffmpeg-yt-dlp
scoop install broot
scoop install mpv-git