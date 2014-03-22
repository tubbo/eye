require 'spec_helper'

describe Image do
  subject do
    Image.new \
      title: 'mirror',
      source: {
        url: 'http://
      }
      url: 'http://
  it "is titled" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "has a source" do
    subject.source = nil
    expect(subject).to_not be_valid
  end

  it "has a source from a recognizable origin" do
    subject.source = 'ruby'
    expect(subject).to_not be_valid
  end

  context "when mirroring an image" do
    it "has a source of 'url'"
    it "has a url"
  end

  context "when uploading a new image" do
    it "has a source of 'file'"
    it "has a file attachment"
  end
end
