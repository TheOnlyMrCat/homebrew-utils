class Runscript < Formula
  desc "Kinda like make, but for running instead"
  homepage "https://github.com/TheOnlyMrCat/runscript"
  url "https://github.com/TheOnlyMrCat/runscript/archive/v1.0.1.zip"
  sha256 "b0824503cfd4037d66be4b83993885f5c4474cea60068cf0632738a6c6bb6005"

  depends_on "rust" => :build

  conflicts_with "run", :because => "It's literally the same program"

  bottle do
    root_url "https://dl.bintray.com/theonlymrcat/bottles-utils"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "15d2da5fd36460c7850bf907e4aa2106e4e2c270f14324f8bce8e63686849a11" => :catalina
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
