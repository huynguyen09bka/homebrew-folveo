cask "folveo" do
  arch arm: "arm64", intel: "intel"

  version "1.15.0"
  sha256 arm:   "598142a8702d25ba8981aa9ac8e61e5d3ed96df7171ec62fe4c75b676d67c870",
         intel: "9d751b3a182b0b3c4830fac51aca7d982843242be47e8aede4a7a08b826eacc1"

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
