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
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.10/t3agent37-macos.tar.gz"
      sha256 "84036d03007687484e51edbceb51cc97f4ba91b6b22067e4dde0f501782bccd4"
    end
    on_intel do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.10/t3agent37-macos.tar.gz"
      sha256 "84036d03007687484e51edbceb51cc97f4ba91b6b22067e4dde0f501782bccd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.10/t3agent37-linux-x86_64.tar.gz"
      sha256 "c9b14a79c180ccafc4e280d98bcab0b30ff4e1f08e0b1a643b16b021f2d25b64"
    end
    on_arm do
      url "https://github.com/dagurleo/t3agent37/releases/download/v0.1.10/t3agent37-linux-arm64.tar.gz"
      sha256 "7b32816bd546c58c97db2a1abea34fb0490c6413319391f5030165ec77ad1eb1"
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
