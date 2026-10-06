cask "markview" do
  version "0.1.0"
  sha256 "18ba91e6bbb5302b894d212fdc4c155307bad8f5533f66c55eb634e2241ee3bc"

  url "https://github.com/dagurleo/markview/releases/download/v#{version}/Markview-#{version}.zip"
  name "Markview"
  desc "Native Markdown viewer with Quick Look previews"
  homepage "https://github.com/dagurleo/markview"

  livecheck do
    url :url
    strategy :github_latest
  end

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
