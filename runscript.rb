class Runscript < Formula
  desc "Kinda like make, but for running instead"
  homepage "https://github.com/TheOnlyMrCat/runscript"
  url "https://github.com/TheOnlyMrCat/runscript/archive/v1.0.0.tar.gz"
  sha256 "6c9b665dd370931439d27155db8eda29462a454a6607e8e0cdfbc739014be962"

  depends_on "rust" => :build

  conflicts_with "run", :because => "It's literally the same program"

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
