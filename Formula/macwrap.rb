class Macwrap < Formula
  desc "A Spotify Wrapped-style yearly analytics tool for your Mac"
  homepage "https://github.com/arinagrawal05/macwrap"
  url "https://github.com/arinagrawal05/macwrap/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "08711891513c92c19e634b0372dd656e075d66df369714414bb273331d0dc915"
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
