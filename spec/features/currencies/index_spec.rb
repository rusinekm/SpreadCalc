require 'spec_helper'
# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website

feature 'Root' do

  scenario 'visit the index' do
    visit currencies_path
    expect(page).to have_content 'List of watched currencies.'
  end

  scenario 'visit the root (same as index, but different path)' do
    visit root_path
    expect(page).to have_content 'List of watched currencies.'
  end
  scenario 'checking if links work properly' do
    currency = FactoryGirl.create(:currency)
    visit root_path
    click_link('show all exchange offices')
    expect(page).to have_content "List of #{currency.name}"
  end
end
