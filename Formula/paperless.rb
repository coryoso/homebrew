class Paperless < Formula
  desc "Local-first document intake and filing service for macOS"
  homepage "https://github.com/coryoso/paperless"
  version "0.1.0"

  on_arm do
    url "https://github.com/coryoso/paperless/releases/download/v0.1.0/paperless_0.1.0_darwin_arm64.tar.gz"
    sha256 "73a42b435226ea4db906058d88adbd59b69fc9b11280065cb52d0b124fe00c0b"
  end

  on_intel do
    url "https://github.com/coryoso/paperless/releases/download/v0.1.0/paperless_0.1.0_darwin_amd64.tar.gz"
    sha256 "c8e4d18b5428c299a7cc6c54b5705274d3926dc4f5a2986678fea274e262ddce"
  end

  depends_on :macos
  depends_on "ollama"
  depends_on "poppler"
  depends_on "qpdf"
  depends_on "tesseract"
  depends_on "tesseract-lang"

  def install
    bin.install "paperless"
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
