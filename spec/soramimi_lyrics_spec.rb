require 'spec_helper'

describe SoramimiLyrics do
  it "should be valid" do
    SoramimiLyrics.should be_a(Module)
  end

  context "when directed to import a file" do
    pending "should open a file when importing"
    pending "should complain when opening a non-existent file"
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
