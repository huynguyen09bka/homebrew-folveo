cask "folveo" do
  arch arm: "arm64", intel: "intel"

  version "1.16.1"
  sha256 arm:   "6aa869cd768a3352eaeb16a9f1ec41cf3b754002451c4bd39fedebdfe6186c12",
         intel: "24a927135f2c3996fcdf6090d03e4b84c267813af2c4794ba8e950482de324e1"

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
