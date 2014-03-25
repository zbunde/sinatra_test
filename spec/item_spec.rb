require 'capybara/rspec'
require 'spec_helper'
require_relative '../app'

Capybara.app = App

feature "Menu Site" do
  scenario "User can add items" do
    visit '/'
    expect(page).to have_content("food")

    click_on "Items"
    expect(page).to_not have_content("new_item")
    fill_in "name", :with => "new_item"
    click_on "New"
    expect(page).to have_content("new_item")

    click_on "new_item"
    expect(page).to have_content ("new_item")

    click_on "edit"
    expect(page).to have_content("new_item")

    fill_in "name", :with => "PIZZZA"

    click_on "edit"
    expect(page).to_not have_content ("new_item")
    expect(page).to have_content("PIZZZA")

    click_on "PIZZZA"
    click_on "delete"
    expect(page).to_not have_content("PIZZZA")


  end
end