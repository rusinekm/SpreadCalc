require 'spec_helper'

feature 'index' do

  scenario 'visit sites index when not logged as admin' do
    visit root_path
    expect(page).not_to have_content 'Delete sites or currencies for sites'
    expect(current_path).to  eq(root_path)
  end

  scenario 'visit visit sites index when logged' do
    Admin.create(email:"a@a.com", password: "12345678", password_confirmation: "12345678")
    visit new_admin_session_path
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    visit sites_path
    expect(current_path).to eq(sites_path)
  end

  scenario 'checking if I can view currency sites & sites' do
    Admin.create(email:"a@a.com", password: "12345678", password_confirmation: "12345678")
    visit new_admin_session_path
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in' 
    currency = FactoryGirl.create(:currency)
    site = FactoryGirl.create(:site)
    allow_any_instance_of(CurrencySite).to receive(:checking_corectness_of_inputs).and_return(true)
    FactoryGirl.create(:currency_site, site_id: site.id, currency_id: currency.id)
    visit sites_path
    expect(page).to have_content "#{site.name}"
    expect(page).to have_content "#{currency.name}"
  end

  scenario 'checking if I can delete currency sites' do
    Admin.create(email:"a@a.com", password: "12345678", password_confirmation: "12345678")
    visit new_admin_session_path
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in' 
    currency = FactoryGirl.create(:currency, name: "text to check")
    site = FactoryGirl.create(:site)
    allow_any_instance_of(CurrencySite).to receive(:checking_corectness_of_inputs).and_return(true)
    FactoryGirl.create(:currency_site, site_id: site.id, currency_id: currency.id)
    visit sites_path
    expect(page).to have_content "#{site.name}"
    expect(page).to have_content "#{currency.name}"
    CurrencySite.last.destroy
    visit sites_path
    expect(page).to have_content "#{site.name}"
    expect(page).not_to have_content "#{currency.name}"
  end

  scenario 'checking if I can delete sites' do
    Site.destroy_all
    Admin.create(email:"a@a.com", password: "12345678", password_confirmation: "12345678")
    visit new_admin_session_path
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in' 
    currency = FactoryGirl.create(:currency, name: "currency name to check")
    currency_name = currency.name
    site = FactoryGirl.create(:site, name: "site name to check")
    site_name = site.name
    allow_any_instance_of(CurrencySite).to receive(:checking_corectness_of_inputs).and_return(true)
    FactoryGirl.create(:currency_site, site_id: site.id, currency_id: currency.id)
    visit sites_path
    expect(page).to have_content site_name
    expect(page).to have_content currency_name
    site.destroy
    visit sites_path
    expect(page).not_to have_content "#{site_name}"
    expect(page).not_to have_content "#{currency_name}"
  end
end
