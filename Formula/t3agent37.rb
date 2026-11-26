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
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.12/t3agent37-macos.tar.gz"
      sha256 "b7a3e61612e107b59a1120c6fd4c189cfd898009aa2603eacb2baf8e842e65fd"
    end
    on_intel do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.12/t3agent37-macos.tar.gz"
      sha256 "b7a3e61612e107b59a1120c6fd4c189cfd898009aa2603eacb2baf8e842e65fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.12/t3agent37-linux-x86_64.tar.gz"
      sha256 "e102d76bc2d96c14b0574b1eecf7e4685b4428cdb8c463af29691114747f39af"
    end
    on_arm do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.12/t3agent37-linux-arm64.tar.gz"
      sha256 "92f3573540c31084f73b449d8826db2f1fd47bcec06af36406e97fcba5da803b"
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
