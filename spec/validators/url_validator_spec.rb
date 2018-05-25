require 'rails_helper'

module Test
  UrlValidatable = Struct.new(:url) do
    include ActiveModel::Validations

    validates :url, url: true
  end
end

describe UrlValidator do
  subject { Test::UrlValidatable.new('https://google.com') }

  it { is_expected.to be_valid }

  it 'is invalid with invalid url' do
    subject.url = 'fkjdhjkd.fkdjhfjkd'
    subject.valid?
    expect(subject.errors[:url]).to match_array('is not an valid web url')
  end
end
