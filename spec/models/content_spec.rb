require 'rails_helper'

describe Content, type: :model do
  describe "Associations" do
    it "belongs to page" do
      assc = described_class.reflect_on_association(:page)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
