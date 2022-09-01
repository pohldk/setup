choco install sops
choco install spacesniffer

winget source update
$PackageIdentifiers = @(
  "Bitwarden.Bitwarden"
  "Flameshot.Flameshot"
  "gerardog.gsudo"
  "Git.Git"
  "GitHub.cli"
  "GitHub.GitHubDesktop"
  "JanDeDobbeleer.OhMyPosh"
  "JetBrains.Toolbox"
  "Microsoft.DotNet.SDK.6"
  "Microsoft.Edge"
  "Microsoft.PowerShell"
  "Microsoft.VisualStudioCode"
  "Microsoft.WindowsTerminal"
  "Mirantis.Lens"
  "OlegDanilov.RapidEnvironmentEditor"
  "Parsec.Parsec"
  "SlackTechnologies.Slack"
  "Spotify.Spotify"
  "WinSCP.WinSCP"
  "Yubico.Authenticator"
)

$wingetList = winget list --accept-source-agreements
foreach ($package in $PackageIdentifiers) {
  if ($wingetList | Select-String -Pattern $package.Replace('+', '\+') -Quiet) {
    "$package already installed"
  } else {
    "Installing $package"
    winget install --exact $package --accept-package-agreements
  }
}
