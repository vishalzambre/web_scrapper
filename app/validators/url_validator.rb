require 'uri'
require 'open-uri'

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    begin
      uri = URI.parse(value)
      valid_url = uri.kind_of?(URI::HTTP) && open(uri)
    rescue URI::InvalidURIError => e
      record.errors[attribute] << e.message
    rescue OpenURI::HTTPError => e
      record.errors[attribute] << e.message
    end

    record.errors[attribute] << (options[:message] || "is not an valid web url") unless valid_url
  end
end
