class T3agent37 < Formula
  desc "Command for T3 Code machines on Agent37 Cloud that sleep when idle"
  homepage "https://t3agent37.dagurleo.com/"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # One build for both chips on macOS.
  on_macos do
    on_arm do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.9/t3agent37-macos.tar.gz"
      sha256 "07eab830051b0f52d2ebbb4e6bb9ed15a662ce07684d44a1aec161e35e8cd3f7"
    end
    on_intel do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.9/t3agent37-macos.tar.gz"
      sha256 "07eab830051b0f52d2ebbb4e6bb9ed15a662ce07684d44a1aec161e35e8cd3f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.9/t3agent37-linux-x86_64.tar.gz"
      sha256 "f893f8c24be7a537ae78b3e06f892178f5fc0c05b1852976ef88e67286df2ec8"
    end
    on_arm do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.9/t3agent37-linux-arm64.tar.gz"
      sha256 "6d619ff3e35079b3e1a39dccd1c043d7c6a520dcca388fb8c5a75266f708c1cf"
    end
  end

  def install
    bin.install "t3agent37"
  end

  def caveats
    <<~TEXT
      The command works with the t3agent37 app while the app runs. Without the app:
        t3agent37 setup
        brew services start t3agent37
      Install this or the app (brew install --cask t3agent37, which has the command too), not both.
    TEXT
  end

  service do
    run [opt_bin/"t3agent37", "serve"]
    environment_variables PATH: std_service_path_env
    keep_alive crashed: true
    log_path var/"log/t3agent37.log"
    error_log_path var/"log/t3agent37.log"
  end

  test do
    assert_match "t3agent37 #{version}", shell_output("#{bin}/t3agent37 --version")
  end
end
