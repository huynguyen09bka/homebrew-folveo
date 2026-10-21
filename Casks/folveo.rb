cask "folveo" do
  arch arm: "arm64", intel: "intel"

  version "1.14.0"
  sha256 arm:   "11a37d43a85012daf85e478fee0a112f453e5c37418ffbeef349eda59f38bb78",
         intel: "418ce435495479b87aa9bb5b71ee746d79ea9f8903380969210d6c04691e0236"

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
  depends_on macos: ">= :monterey"

  app "Folveo.app"

  zap trash: [
    "~/Library/Application Support/Folveo",
    "~/Library/Logs/Folveo",
    "~/Library/Preferences/io.folveo.desktop.plist",
    "~/Library/Saved Application State/io.folveo.desktop.savedState",
  ]
end
