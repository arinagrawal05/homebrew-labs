class Macwrap < Formula
  desc "A Spotify Wrapped-style yearly analytics tool for your Mac"
  homepage "https://github.com/arinagrawal05/macwrap"
  url "https://github.com/arinagrawal05/macwrap/releases/download/v1.0.1/macwrap-1.0.1.tar.gz"
  sha256 "3c76f4b635a31b3677374eb7b79b4669f800cef463d05a94b6b3f766752534b0"
  license "MIT"
  
  depends_on "python@3.12"
  
  def install
    rm_rf ".git"
    
    # Create virtualenv and install dependencies
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "textual"
    # Add other dependencies as needed:
    # venv.pip_install "pandas", "numpy", etc.
    
    # Install app files into the virtualenv site-packages
    libexec.install Dir["*"]
    
    # Create wrapper that uses the virtualenv Python
    (bin/"macwrap").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec "#{venv.root}/bin/python3.12" "#{libexec}/macwrap.py" "$@"
    EOS
    
    chmod 0755, bin/"macwrap"
  end
  
  test do
    system "#{bin}/macwrap", "--version"
  end
end
