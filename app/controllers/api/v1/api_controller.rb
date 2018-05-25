module Api
  module V1
    class ApiController < ApplicationController
      include JSONAPI::ActsAsResourceController
    end
  end
end
