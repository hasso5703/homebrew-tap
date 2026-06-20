cask "talkink" do
  version "0.7.0"
  sha256 "e1d7e79077e66dd88e78f8d2d2142c8cd33107cf6dce2e02826da578140e56d3"

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
    "~/.cache/huggingface/hub/mlx-audio",
    "~/Library/Application Support/Soyle",
    "~/Library/Caches/io.github.hasso5703.soyle",
    "~/Library/HTTPStorages/io.github.hasso5703.soyle",
    "~/Library/Preferences/io.github.hasso5703.soyle.plist",
    "~/Library/WebKit/io.github.hasso5703.soyle",
  ]
end
