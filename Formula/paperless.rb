class Paperless < Formula
  desc "Local-first document intake and filing service for macOS"
  homepage "https://github.com/coryoso/paperless"
  url "https://github.com/coryoso/paperless/releases/download/v0.1.1/paperless_0.1.1_darwin_all.tar.gz"
  sha256 "3da37112141083b3df2b6c061f2bfba252be967d4c00db5d862dae6cf364c36b"
  depends_on :macos

  depends_on "ollama"
  depends_on "poppler"
  depends_on "qpdf"
  depends_on "tesseract"
  depends_on "tesseract-lang"

  def install
    binary = Hardware::CPU.arm? ? "paperless-arm64" : "paperless-amd64"
    bin.install binary => "paperless"
    etc.install "config.example.toml" => "paperless.toml"
  end

  def caveats
    <<~EOS
      Create your user configuration and initialize Paperless with:
        paperless configure
        paperless init

      To run Paperless as a macOS LaunchAgent:
        paperless service install
        paperless service start
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/paperless version")
  end
end
