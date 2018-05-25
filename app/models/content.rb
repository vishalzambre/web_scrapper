class Content < ApplicationRecord
  belongs_to :page, inverse_of: :contents, touch: true
end
