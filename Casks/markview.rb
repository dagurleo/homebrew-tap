cask "markview" do
  version "0.1.1"
  sha256 "05a02e1638ce35fa561a7d753bd374a248e9f2f4269f94458502fec08fe1ff5e"

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

  zap trash: [
    "~/Library/Application Scripts/com.dagurleo.markview.quicklook",
    "~/Library/Caches/com.dagurleo.markview",
    "~/Library/Containers/com.dagurleo.markview.quicklook",
    "~/Library/HTTPStorages/com.dagurleo.markview",
    "~/Library/Preferences/com.dagurleo.markview.plist",
    "~/Library/Saved Application State/com.dagurleo.markview.savedState",
    "~/Library/WebKit/com.dagurleo.markview",
  ]
end
