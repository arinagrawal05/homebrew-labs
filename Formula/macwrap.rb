class Macwrap < Formula
  desc "A Spotify Wrapped-style yearly analytics tool for your Mac"
  homepage "https://github.com/arinagrawal05/macwrap"
  url "https://github.com/arinagrawal05/macwrap/releases/download/v1.0.1/macwrap-1.0.1.tar.gz"
  sha256 "3c76f4b635a31b3677374eb7b79b4669f800cef463d05a94b6b3f766752534b0"
  license "MIT"
  
  depends_on "python@3.12"
  
  def install
    # Install the macwrap directory to prefix
    prefix.install "macwrap"
    
    # Create wrapper in bin
    (bin/"macwrap").write_env_script(
      prefix/"macwrap/bin/macwrap",
      PYTHONPATH: prefix/"macwrap",
      PYTHONHOME: Formula["python@3.12"].opt_prefix
    )
  end
  
  test do
    system "#{bin}/macwrap", "--version"
  end
end
