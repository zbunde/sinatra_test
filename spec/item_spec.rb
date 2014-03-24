require 'rspec/core'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'managing items' do
  scenario 'user interacts with homepage' do
      visit "/"
      expect(page).to have_title "food"
      click_link "new"
  end

end

