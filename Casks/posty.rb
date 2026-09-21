cask "posty" do
  version "0.1.2"
  sha256 "e28234fe6a844315eedc5dce71c324c4a6e84bdf24f02c5dd3a84bac6206c32a"

  url "https://github.com/coryoso/posty/releases/download/v#{version}/Posty-#{version}.zip"
  name "Posty"
  desc "Native PostgreSQL client"
  homepage "https://github.com/coryoso/posty"

  depends_on macos: :tahoe

  app "Posty.app"
end
