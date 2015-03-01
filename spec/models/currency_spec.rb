require 'rails_helper'

RSpec.describe Currency, type: :model do
  context "checking validity of data" do
    let(:currency) {FactoryGirl.create(:currency)}
    let(:site) {FactoryGirl.create(:site)}
    it "checking for collection of last statistics" do
      expect(currency.last_statistics).to eq []
    end
    it "when searching for data that is not present" do
      expect(currency.last_statistics).to eq []
    end
    it "when there are multiple data for one site" do
      4.times do
        FactoryGirl.create(:stat_node, currency_id:currency.id, site_id:site.id)
      end
      allow(currency).to receive(:sites).and_return([site])
      expect(currency.last_statistics).to eq [StatNode.last.id]
    end
    it "When there are multiple sites" do
      
    end
  end
end
