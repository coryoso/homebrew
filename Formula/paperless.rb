class Paperless < Formula
  desc "Local-first document intake and filing service for macOS"
  homepage "https://github.com/coryoso/paperless"
  url "https://github.com/coryoso/paperless/releases/download/v0.1.4/paperless_0.1.4_darwin_all.tar.gz"
  sha256 "8b71945b5cb7a8658d44d3f84cd6d0185bcccb95e1bcd214ce6c2b591dfbe4ee"
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
      Local classification requires a running Ollama app or service.

      Start Paperless now and automatically at login with:
        brew services start paperless

      Then open http://127.0.0.1:8844, choose your documents folder,
      and follow the guided scanner sharing setup. Paperless will wait
      safely without processing documents until setup is complete.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/paperless version")
  end
end
