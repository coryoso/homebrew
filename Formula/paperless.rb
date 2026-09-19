class Paperless < Formula
  desc "Local-first document intake and filing service for macOS"
  homepage "https://github.com/coryoso/paperless"
  url "https://github.com/coryoso/paperless/releases/download/v0.2.0/paperless_0.2.0_darwin_all.tar.gz"
  sha256 "54bcad13b7df57e9d9949ec1ef28fcddfbdebaa79abd8ff5a2a596608bff3c08"
  depends_on :macos

  depends_on "poppler"
  depends_on "qpdf"
  depends_on "tesseract"
  depends_on "tesseract-lang"

  def install
    binary = Hardware::CPU.arm? ? "paperless-arm64" : "paperless-amd64"
    bin.install binary => "paperless"
    etc.install "config.example.toml" => "paperless.toml"
  end

  service do
    run [opt_bin/"paperless", "run"]
    run_at_load true
    keep_alive true
    process_type :interactive
    environment_variables PATH: std_service_path_env
    log_path var/"log/paperless.log"
    error_log_path var/"log/paperless.error.log"
  end

  def caveats
    <<~EOS
      Local classification uses Ollama or Apple Foundation Models.
      Choose Apple Foundation Models in Setup if `fm available` succeeds,
      or use a running Ollama app or service with the configured model.

      Start Paperless now and automatically at login with:
        brew services start paperless

      Then run `paperless url` to print the configured dashboard address,
      open it in a browser, choose your documents folder,
      and follow the guided scanner sharing setup. Paperless will wait
      safely without processing documents until setup is complete.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/paperless version")
  end
end
