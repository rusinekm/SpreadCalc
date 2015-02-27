require 'rails_helper'

RSpec.describe Currency, type: :model do
  context "checking validity of data" do
    let(:currency) {FactoryGirl.create(:currency)}
    it "checking for collection of last statistics" do
      expect(currency.last_statistics).to eq []
    end
    it "when there are no data" do
      expect(currency.current_buy_office(currency.last_statistics)).not_to be
      expect(currency.current_sell_office(currency.last_statistics)).not_to be
      expect(currency.current_buy_value(currency.last_statistics)).to eq 'no data'
      expect(currency.current_sell_value(currency.last_statistics)).to eq 'no data'
    end
  end
end
