class Macwrap < Formula
  desc "A Spotify Wrapped-style yearly analytics tool for your Mac"
  homepage "https://github.com/arinagrawal05/macwrap"
  url "https://github.com/arinagrawal05/macwrap/releases/download/v1.0.1/macwrap-1.0.1.tar.gz"
  sha256 "3c76f4b635a31b3677374eb7b79b4669f800cef463d05a94b6b3f766752534b0"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Install the entire project into libexec
    libexec.install Dir["*"]

    # Install the launcher script
    bin.install "bin/macwrap"

    # Make launcher use Python from Homebrew
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => libexec)
  end

  test do
    system "#{bin}/macwrap", "--version"
  end
end
