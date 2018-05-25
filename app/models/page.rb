class Page < ApplicationRecord
  validates :url, presence: true, url: true
  has_many :contents, inverse_of: :page

  after_create :parse
  after_update :parse

  def parse
    parser.parse
  end

  private

  def parser
    @parser ||= WebParser.new(self)
  end
end
