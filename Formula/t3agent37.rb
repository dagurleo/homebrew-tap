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
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.11/t3agent37-macos.tar.gz"
      sha256 "9eeff5d36e6a5439bad93e42e62e12aa53033b505b91527c9ff5f586c30fdbc3"
    end
    on_intel do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.11/t3agent37-macos.tar.gz"
      sha256 "9eeff5d36e6a5439bad93e42e62e12aa53033b505b91527c9ff5f586c30fdbc3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.11/t3agent37-linux-x86_64.tar.gz"
      sha256 "179b86264c12cadb6dcbbd1edbd667896cd61259ed5d4a93a7f557c11b67e476"
    end
    on_arm do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.11/t3agent37-linux-arm64.tar.gz"
      sha256 "9eac06ab8e86c2d27c65431ffdb765ec1bdcba5d4a1c0ff0eeb85c4089334ea8"
    end
  end

  def install
    bin.install "t3agent37"
    generate_completions_from_executable(bin/"t3agent37", "completions")
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
