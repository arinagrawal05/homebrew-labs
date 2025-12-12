class Macwrap < Formula
  desc "A Spotify Wrapped-style yearly analytics tool for your Mac"
  homepage "https://github.com/arinagrawal05/macwrap"
  url "https://github.com/arinagrawal05/macwrap/releases/download/v1.0.1/macwrap-1.0.1.tar.gz"
  sha256 "3c76f4b635a31b3677374eb7b79b4669f800cef463d05a94b6b3f766752534b0"
  license "MIT"
  
  depends_on "python@3.12"
  
  resource "textual" do
    url "https://files.pythonhosted.org/packages/3b/5d/04e3ff5b2d1c0f8918e5c6e8e0e9f3a4a1e9f7c7b8c9d0e1f2a3b4c5d6e7/textual-0.86.3.tar.gz"
    sha256 "4b273d8c1c0d8c4c3e0e0f9e3e4e5e6e7e8e9e0e1e2e3e4e5e6e7e8e9e0e1e2"
  end
  
  def install
    rm_rf ".git"
    
    # Create virtualenv and install textual
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "textual"
    
    # Install app files
    libexec.install Dir["*"]
    
    # Create wrapper
    (bin/"macwrap").write_env_script(libexec/"bin/macwrap",
      PYTHONPATH: libexec,
      PATH: "#{venv.root}/bin:$PATH"
    )
  end
  
  test do
    system "#{bin}/macwrap", "--version"
  end
end
