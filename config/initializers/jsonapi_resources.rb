JSONAPI.configure do |config|
  # built in paginators are :none, :offset, :paged
  config.default_paginator = :paged
  config.default_page_size = 50
  config.maximum_page_size = 1000

  # Do this if you use UUID's instead of Integers for id's
  config.resource_key_type = :uuid
end
