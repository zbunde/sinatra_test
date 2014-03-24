require 'rspec/core'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'managing items' do
scenario 'user visits homepage' do
    visit "/"

  end
end

