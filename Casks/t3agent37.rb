cask "t3agent37" do
  version "0.1.11"
  sha256 "119ce0452fa95129a94d31530eb884f4726ae61e45325da5baabf6b8eda8562b"

  url "https://github.com/dagurleo/t3agent37/releases/download/v#{version}/t3agent37.dmg"
  name "t3agent37"
  desc "Menu bar app for T3 Code machines on Agent37 Cloud that sleep when idle"
  homepage "https://t3agent37.dagurleo.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "t3agent37.app"
  # The app's program is the `t3agent37` command too, and updates with the app.
  binary "#{appdir}/t3agent37.app/Contents/MacOS/t3agent37"

  zap trash: [
    "~/Library/Application Support/dev.t3agent37.app",
    "~/Library/Caches/dev.t3agent37.app",
    "~/Library/HTTPStorages/dev.t3agent37.app",
    "~/Library/LaunchAgents/dev.t3agent37.serve.plist",
    "~/Library/Logs/t3agent37.log",
    "~/Library/Preferences/dev.t3agent37.app.plist",
  ]
end
