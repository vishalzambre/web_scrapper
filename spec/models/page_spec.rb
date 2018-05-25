require 'rails_helper'
require "set"

describe Page, type: :model do
  describe "Validations" do
    subject { described_class.new }

    it "is valid with valid attributes" do
      subject.url = 'https://vishal.zambre.in'
      expect(subject).to be_valid
    end

    it "is not valid without a url" do
      expect(subject).to_not be_valid
    end

    it "is not valid with invalid or fake url" do
      subject.url = 'fdjhfjhdf.fdjkhf'
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many contents" do
      assc = described_class.reflect_on_association(:contents)
      expect(assc.macro).to eq :has_many
    end
  end

  describe "#parse" do
    before(:each) do
      @page = FactoryBot.create(:page)
      @page.parse
    end

    it 'parse and update title' do
      expect(@page.title.present?).to be_truthy
    end

    it 'extracts contents from web' do
      expect(@page.contents.any?).to be_truthy
    end

    it 'extracts only header tags and anchors from web' do
      tags = @page.contents.pluck(:tag).uniq
      allowed_tags = WebParser::HEADER_TAGS + ['a']
      expect(tags.to_set).to be_subset(allowed_tags.to_set)
    end
  end
end
