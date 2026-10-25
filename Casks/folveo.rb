cask "folveo" do
  arch arm: "arm64", intel: "intel"

  version "1.16.0"
  sha256 arm:   "d37cbb3fc98062ea2461cc223d2e1521f3f018c30a4b1002a9fc597edb1fa565",
         intel: "48f641c1d1ed7eb8421da8572443a8ad540ae1d0afa951a9eb97ebca165bbe62"

  url "https://dl.folveo.app/Folveo-#{version}-#{arch}.dmg"
  name "Folveo"
  desc "AI slide studio that runs on the AI subscription you already have"
  homepage "https://folveo.app/"

  livecheck do
    url "https://api.folveo.app/api/update-manifest.json"
    strategy :json do |json|
      json["latest"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Folveo.app"

  zap trash: [
    "~/Library/Application Support/Folveo",
    "~/Library/Logs/Folveo",
    "~/Library/Preferences/io.folveo.desktop.plist",
    "~/Library/Saved Application State/io.folveo.desktop.savedState",
  ]
end
