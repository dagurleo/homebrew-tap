cask "markview" do
  version "0.4.0"
  sha256 "e95d24079266c662fafd41e294db51d56290b4ecd3e8b0509701c84b97621d0f"

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
