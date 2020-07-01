class Runscript < Formula
  desc "Kinda like make, but for running instead"
  homepage "https://github.com/TheOnlyMrCat/runscript"
  url "https://github.com/TheOnlyMrCat/runscript/archive/v1.0.1.zip"
  sha256 "b0824503cfd4037d66be4b83993885f5c4474cea60068cf0632738a6c6bb6005"

  depends_on "rust" => :build

  conflicts_with "run", :because => "It's literally the same program"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-utils"
    cellar :any_skip_relocation
    sha256 "9225136209cdd9e25951e2c24b4522ff3ddc977595b0c5323fa9d7cab6895162" => :catalina
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    text = "Homebrew test"
    (testpath/"run").write <<~EOS
      #-
      echo #{text}
      #/
    EOS
    assert_equal text, shell_output("#{bin}/run").chomp
  end
end
