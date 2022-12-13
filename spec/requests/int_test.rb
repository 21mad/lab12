require 'rails_helper'
require 'spec_helper'
require 'faker'

RSpec.describe 'int_tests', type: :request do
  describe 'SeleniumIDE tests' do
    before(:each) do
      @driver = Selenium::WebDriver.for :chrome
      @vars = {}
    end
    after(:each) do
      @driver.get('http://127.0.0.1:3000/session/logout')
      @driver.quit
      User.where(username: "user1").destroy_all
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

    it 'should create new user and calculate' do
      @driver.get('http://127.0.0.1:3000/users/new')
      @driver.find_element(:id, 'user_username').send_keys('user1')
      @driver.find_element(:id, 'user_password').click
      @driver.find_element(:id, 'user_password').send_keys('cool_pass')
      # Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:id, 'segments').displayed? }
      @driver.find_element(:name, 'commit').click
      @driver.get('http://127.0.0.1:3000')
      @driver.find_element(:id, 'array').click
      @driver.find_element(:id, 'array').send_keys('-1 21 6 28 0 8128 -6 8128 496 28 7 1 6 6')
      @driver.find_element(:name, 'commit').click
      expect(@driver.find_element(:id, 'max_seg').text).to eq('Самый длинный отрезок: 8128 496 28')
    end
  end
end