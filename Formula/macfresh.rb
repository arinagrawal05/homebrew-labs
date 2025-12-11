class Macfresh < Formula
  desc "Ultra-safe macOS cleanup tool that frees space without risking user data"
  homepage "https://github.com/arinagrawal05/macfresh"
  url "https://github.com/arinagrawal05/macfresh/releases/download/v1.0.0/macfresh.sh"
  version "1.0.0"
  sha256 "REPLACE_WITH_YOUR_SHA256"

  depends_on :macos

  def install
    bin.install "macfresh.sh" => "macfresh"
  end
end
