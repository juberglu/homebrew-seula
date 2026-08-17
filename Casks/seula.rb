cask "seula" do
  version "1.3.0"
  sha256 "41f85e58c2adc0420bc127e8d25d7867802c83cf26c368cbccb701b23c15e38d"

  url "https://github.com/juberglu/seula-releases/releases/download/v#{version}/Seula-#{version}.dmg",
      verified: "github.com/juberglu/seula-releases/"
  name "Seula"
  desc "Photo culling tool for RAW and JPEG"
  homepage "https://seula.app/"

  livecheck do
    url "https://seula.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Seula updates itself through Sparkle. Without this, `brew upgrade` would
  # reinstall over a version Sparkle had already replaced.
  auto_updates true
  depends_on macos: :monterey

  app "Seula.app"

  # The directly distributed build is not sandboxed, so its state is not in a
  # container. The App Store build's container is listed too, harmlessly, for
  # anyone who has run both.
  zap trash: [
    "~/Library/Application Support/Seula",
    "~/Library/Caches/app.seula.mac",
    "~/Library/Containers/app.seula.mac",
    "~/Library/Preferences/app.seula.mac.plist",
    "~/Library/Saved Application State/app.seula.mac.savedState",
  ]
end
