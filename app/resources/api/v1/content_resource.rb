module Api
  module V1
    class ContentResource < JSONAPI::Resource
      primary_key :id

      attributes :tag, :text
      has_one :page

      filter :page
    end
  end
end
