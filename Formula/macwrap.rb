class Macwrap < Formula
  desc "A Spotify Wrapped-style yearly analytics tool for your Mac"
  homepage "https://github.com/arinagrawal05/macwrap"
  url "https://github.com/arinagrawal05/macwrap/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "318482df71efd8339b1fe301102ca44ebd6b785dd7f127baf43941567da24b00"
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
