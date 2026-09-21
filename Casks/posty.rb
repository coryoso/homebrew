cask "posty" do
  version "0.1.1"
  sha256 "811e34a17dfde5cdc5093af8cc305b253938d4f65b42f315fb7bb855195d0ae5"

  url "https://api.github.com/repos/coryoso/posty/releases/assets/579010717",
      header: ["Accept: application/octet-stream",
               "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}"]
  name "Posty"
  desc "Native PostgreSQL client"
  homepage "https://github.com/coryoso/posty"

  depends_on macos: :tahoe

  app "Posty.app"
end
