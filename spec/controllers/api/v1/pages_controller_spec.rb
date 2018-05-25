require 'rails_helper'

describe Api::V1::PagesController , type: :controller do
  before(:each) do
    request.headers['Content-Type'] = "application/vnd.api+json"
  end

  describe 'POST /v1/pages' do
    before(:each) do
      post :create, params: { data: { type: "pages", attributes: { url: "https://vishal.zambre.in" } } }
    end

    it 'returns 200 status-code' do
      expect(response).to be_success
    end

    it 'returns pages type of data' do
      # check to make sure it returns page object
      expect(json['data']['type']).to eq('pages')
    end

    it 'extracts title from website' do
      # check to make sure it returns page object
      expect(json['data']['attributes']['title'].present?).to be_truthy
    end

    it 'stores url ' do
      # check to make sure it returns page object
      expect(json['data']['attributes']['url']).to eq('https://vishal.zambre.in')
    end
  end

  describe 'POST /v1/pages' do
    before(:each) do
      FactoryBot.create(:page, url: "https://vishal.zambre.in")
      FactoryBot.create(:page, url: "https://facebook.com")
      get :index, params: {}
    end

    it 'returns 200 status-code' do
      expect(response).to be_success
    end

    it 'returns 2 pages' do
      expect(json['data'].size).to eq(2)
    end
  end
end
