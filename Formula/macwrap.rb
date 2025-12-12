class Macwrap < Formula
  desc "A Spotify Wrapped-style yearly analytics tool for your Mac"
  homepage "https://github.com/arinagrawal05/macwrap"
  url "https://github.com/arinagrawal05/macwrap/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ad9dfef85e544d8674fab43f8545aa1922c7aa4a4772498a921a19acf19824a8"
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
