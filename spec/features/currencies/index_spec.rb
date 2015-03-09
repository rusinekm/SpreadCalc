require 'spec_helper'

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
    expect(page).to have_content  "List of current #{currency.name} exchange deals"
  end
end

