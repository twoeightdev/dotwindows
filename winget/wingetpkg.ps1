Write-Output "Installing Apps"
$apps = @(
    @{name = "Microsoft.WindowsTerminal" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.VCRedist.2015+.x86" },
    @{name = "Microsoft.VCRedist.2015+.x64" },
    @{name = "Python.Python.3.11" },
    @{name = "SublimeHQ.SublimeText.4" },
    @{name = "OpenJS.NodeJS" },
    @{name = "GNU.Emacs" },
    @{name = "qutebrowser.qutebrowser" },
    @{name = "JohnMacFarlane.Pandoc" },
    @{name = "BurntSushi.ripgrep.GNU" },
    @{name = "yt-dlp.yt-dlp" },
    @{name = "ImageMagick.ImageMagick" },
    @{name = "MiKTeX.MiKTeX" },
    @{name = "Bitwarden.Bitwarden" },
    @{name = "OBSProject.OBSStudio" },
    @{name = "Flow-Launcher.Flow-Launcher" },
    @{name = "lars-berger.GlazeWM" }
    @{name = "qBittorrent.qBittorrent" },
    @{name = "Telegram.TelegramDesktop" },
    @{name = "Dropbox.Dropbox" }
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
    }
    else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}