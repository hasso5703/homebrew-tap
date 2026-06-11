cask "talkink" do
  version "0.6.0"
  sha256 "17bf6c7ad64daea905467aaafdce364dcf2f35e94ac36f6f66f4244740cc56ba"

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
