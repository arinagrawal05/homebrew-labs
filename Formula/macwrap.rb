class Macwrap < Formula
  desc "A Spotify Wrapped-style yearly analytics tool for your Mac"
  homepage "https://github.com/arinagrawal05/macwrap"
  url "https://github.com/arinagrawal05/macwrap/releases/download/v1.0.1/macwrap-1.0.1.tar.gz"
  sha256 "3c76f4b635a31b3677374eb7b79b4669f800cef463d05a94b6b3f766752534b0"
  license "MIT"
  
  depends_on "python@3.12"
  
  def install
    # Write debug info to a file we can read
    File.open("/tmp/homebrew-debug.txt", "w") do |f|
      f.puts "Current directory: #{Dir.pwd}"
      f.puts "\nFiles in current dir:"
      f.puts Dir.entries(".").sort.join("\n")
      f.puts "\nGlob results:"
      f.puts "Dir['*']: #{Dir['*'].inspect}"
      f.puts "Dir['**/*']: #{Dir['**/*'].first(20).inspect}"
    end
    
    # Try to install
    if Dir["*"].empty?
      odie "No files found in current directory! Check /tmp/homebrew-debug.txt"
    end
    
    libexec.install Dir["*"]
    
    # Create wrapper
    (bin/"macwrap").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/macwrap.py" "$@"
    EOS
    
    chmod 0755, bin/"macwrap"
  end
  
  test do
    system "#{bin}/macwrap", "--version"
  end
end
