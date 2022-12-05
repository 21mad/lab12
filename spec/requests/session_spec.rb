require 'rails_helper'
require 'selenium-webdriver'
require 'json'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/session/login"
      expect(response).to have_http_status(:success)
    end
  end
  

  describe 'SeleniumIDE tests' do
    before(:each) do
      @driver = Selenium::WebDriver.for :chrome
      @vars = {}
    end
    after(:each) do
      @driver.quit
    end
    it 'should calculate when logged in' do
      @driver.get('http://127.0.0.1:3000/session/login')
      @driver.find_element(:id, 'username').click
      @driver.find_element(:id, 'username').send_keys('hello')
      @driver.find_element(:id, 'password').click
      @driver.find_element(:id, 'password').send_keys('world')
      @driver.find_element(:name, 'commit').click
      @driver.find_element(:id, 'array').click
      @driver.find_element(:id, 'array').send_keys('-1 21 6 28 0 8128 -6 8128 496 28 7 1 6 6')
      @driver.find_element(:name, 'commit').click
      expect(@driver.find_element(:id, 'max_seg').text).to eq('Самый длинный отрезок: 8128 496 28')
    end
  end
end
