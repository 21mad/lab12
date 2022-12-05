require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /output" do
    it "returns http success" do
      get "/task/output", params: { array: '228 46 6' }
      expect(response).to have_http_status(302)
    end
  end

end
