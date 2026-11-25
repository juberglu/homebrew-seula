cask "seula" do
  version "1.4.0"
  sha256 "2395c4845753f56455b51c0f7130e2e3be32731a4d66cbe9c884e85590a3f71d"

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
