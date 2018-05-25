module Api
  module V1
    class PageResource < JSONAPI::Resource
      primary_key :id

      attributes :title, :url, :las_scrapped_at

      has_many :contents, acts_as_set: true

      # Returns last updated at in format
      # 24 May, 2018 12:27 PM
      def las_scrapped_at
        @model.updated_at.strftime('%d %b, %Y %I:%M %p')
      end

      filter :contents
      filters :url
    end
  end
end
