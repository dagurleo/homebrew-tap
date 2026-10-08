cask "markview" do
  version "0.3.0"
  sha256 "db2c5b208a55b4aa86891f5c87b941b42e573ac9b92603d524eab1c2e9683137"

  url "https://github.com/dagurleo/markview/releases/download/v#{version}/Markview-#{version}.zip"
  name "Markview"
  desc "Native Markdown viewer with Quick Look previews"
  homepage "https://github.com/dagurleo/markview"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Markview.app"
  binary "#{appdir}/Markview.app/Contents/Resources/markview"

  zap trash: [
    "~/Library/Application Scripts/com.dagurleo.markview.quicklook",
    "~/Library/Caches/com.dagurleo.markview",
    "~/Library/Containers/com.dagurleo.markview.quicklook",
    "~/Library/HTTPStorages/com.dagurleo.markview",
    "~/Library/Preferences/com.dagurleo.markview.plist",
    "~/Library/Saved Application State/com.dagurleo.markview.savedState",
  ]
end
