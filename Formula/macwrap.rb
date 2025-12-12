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
    virtualenv_install_with_resources using: "python@3.12"
    
    # Since virtualenv_install_with_resources expects a setup.py,
    # we need a different approach. Let's use system pip directly.
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "pip", "install",
           "--target=#{libexec}", "textual"
    
    # Install app files
    libexec.install Dir["*"]
    
    # Create wrapper
    (bin/"macwrap").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/macwrap.py" "$@"
    EOS
    
    chmod 0755, bin/"macwrap"
  end
  
  test do
    system "#{bin}/macwrap", "--version"
  end
end
