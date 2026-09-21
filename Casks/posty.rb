cask "posty" do
  version "0.1.1"
  sha256 "811e34a17dfde5cdc5093af8cc305b253938d4f65b42f315fb7bb855195d0ae5"

  url "https://github.com/coryoso/posty/releases/download/v#{version}/Posty-#{version}.zip"
  name "Posty"
  desc "Native PostgreSQL client"
  homepage "https://github.com/coryoso/posty"

  depends_on macos: :tahoe

  app "Posty.app"
end
