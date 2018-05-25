RSpec.describe Api::V1::ContentResource, type: :resource do
  let(:content) { FactoryBot.create(:content) }
  let(:content) { FactoryBot.create(:content) }
  subject { described_class.new(content, {}) }

  it { is_expected.to have_primary_key :id }
  it { is_expected.to have_attribute :tag }
  it { is_expected.to have_attribute :text }
  it { is_expected.to have_one(:page).with_class_name("Page") }
  it { is_expected.to filter(:page) }
end
