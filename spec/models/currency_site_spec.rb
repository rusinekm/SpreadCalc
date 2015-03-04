require 'rails_helper'

RSpec.describe CurrencySite, type: :model do
  context 'checking if custom validation is correct' do
    # invalid due to change of parsing validation
    # it "when css inputs are supposed be correct" do
    #   allow_any_instance_of(CurrencySite).to receive(:parse_buy_value).and_return(1)
    #   allow_any_instance_of(CurrencySite).to receive(:parse_sell_value).and_return(2)
    #   allow_any_instance_of(CurrencySite).to receive_message_chain(:site, :url).and_return('https://www.google.com/')
    #   expect(FactoryGirl.build(:currency_site)).to be_valid
    # end

    it "when css inputs are supposed not to be correct" do
      allow_any_instance_of(CurrencySite).to receive(:parse_buy_value).and_return(1)
      allow_any_instance_of(CurrencySite).to receive(:parse_sell_value).and_return(0)
      allow_any_instance_of(CurrencySite).to receive_message_chain(:site, :url).and_return('https://www.google.com/')
      expect(FactoryGirl.build(:currency_site)).not_to be_valid
    end
  end  
end
