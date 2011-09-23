require 'spec_helper'

describe SoramimiLyrics do
  it "should be valid" do
    SoramimiLyrics.should be_a(Module)
  end

  let (:fixtures_path) { File.join(PROJECT_ROOT, 'spec', 'fixtures') }

  context "when directed to import a file" do
    it "should open a file when importing" do
      target = File.join(fixtures_path, 'blank.txt')
      File.should_receive(:open).with(target, 'rb').and_return('')
      lyrics = SoramimiLyrics.import(:file => target)
      lyrics.to_timecodes.should == []
    end

    it "should complain when opening a non-existent file" do
      target = File.join(fixtures_path, 'doesnt_exist.txt')
      File.should_receive(:open).with(target, 'rb').and_raise(::Errno::ENOENT)
      lambda { SoramimiLyrics.import(:file => target) }.should raise_error(Errno::ENOENT)
    end
  end

  context "when directed to import a string" do
    pending "should use the lyrics passed to it"
  end

  context "when parsing" do
    pending "should parse well-formed files with basic timestamps and blank lines"
    pending "should parse blank files"
    pending "should parse files with no timestamps"
    pending "should parse and trim files with trailing syllable or unstamped lines"
  end
end
