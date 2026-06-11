cask "talkink" do
  version "0.6.1"
  sha256 "9485d8e7119b9d8fdcff0b8404c77ba528fb1d9c01e81c8a3a1aca99211d0f81"

  url "https://github.com/hasso5703/talkink/releases/download/v#{version}/Talkink.dmg",
      verified: "github.com/hasso5703/talkink/"
  name "Talkink"
  desc "Push-to-talk dictation that runs 100% on-device"
  homepage "https://talkink.app/"

  livecheck do
    url "https://talkink.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Talkink.app"

  zap trash: [
    "~/.cache/huggingface/mlx-audio",
    "~/Library/Application Support/Soyle",
    "~/Library/Caches/io.github.hasso5703.soyle",
    "~/Library/HTTPStorages/io.github.hasso5703.soyle",
    "~/Library/Preferences/io.github.hasso5703.soyle.plist",
    "~/Library/WebKit/io.github.hasso5703.soyle",
  ]
end
