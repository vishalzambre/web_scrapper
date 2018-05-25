RSpec.describe Api::V1::PageResource, type: :resource do
  let(:page) { FactoryBot.create(:page) }
  subject { described_class.new(page, {}) }

  it { is_expected.to have_primary_key :id }
  it { is_expected.to have_attribute :title }
  it { is_expected.to have_attribute :las_scrapped_at }
  it { is_expected.to have_attribute :url }
  it { is_expected.to have_many(:contents).with_class_name("Content") }
  it { is_expected.to filter(:url) }
end
