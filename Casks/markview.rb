cask "markview" do
  version "0.2.0"
  sha256 "0bf890086ac9cd80e905884b618d17c76a6bb81a526362f67cf6346b604e03c0"

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
