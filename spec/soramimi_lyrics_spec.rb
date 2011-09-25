require 'spec_helper'
require 'json'

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
    def test_with_fixture(filename_stem)
      full_stem = File.join(fixtures_path, filename_stem)
      fixtures = {}
      ['json', 'plain', 'txt'].each do |ext|
        fixtures[ext] = File.open("#{full_stem}.#{ext}", 'rb') { |f| f.read }
        fixtures[ext].chomp!
      end

      # Load...
      lyrics = SoramimiLyrics.import(fixtures['txt'])

      # Check the output we receive matches up with the pre-calculated results
      lyrics.to_plain_lyrics.should == fixtures['plain']
      fixtures['json'].should == lyrics.to_timecodes.to_json
    end
    
    it "should parse well-formed files with basic timestamps and blank lines" do
      test_with_fixture 'basic'
    end
    it "should parse blank files" do
      test_with_fixture 'blank'
    end
    it "should parse files with no timestamps" do
      test_with_fixture 'no_stamps'
    end
    it "should parse and trim files with trailing syllable or unstamped lines" do
      test_with_fixture 'trailing'
    end
  end
end
