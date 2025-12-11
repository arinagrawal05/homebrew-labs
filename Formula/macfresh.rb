class Macfresh < Formula
  desc "Ultra-safe macOS cleanup tool that frees space without risking user data"
  homepage "https://github.com/arinagrawal05/macfresh"
  url "https://github.com/arinagrawal05/macfresh/releases/download/v1.0.1/macfresh.sh"
  version "1.0.1"
  sha256 "4748cd8abdc89147b617bdc63dc3f9743fb3adec17fe80818eca99848ffc2a66"

  depends_on :macos

  def install
    bin.install "macfresh.sh" => "macfresh"
  end
end
