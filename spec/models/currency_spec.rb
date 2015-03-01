require 'rails_helper'

RSpec.describe Currency, type: :model do
  context "checking validity of data" do
    let(:currency1) {FactoryGirl.create(:currency)}
    let(:currency2) {FactoryGirl.create(:currency)}
    let(:currency3) {FactoryGirl.create(:currency)}
    let(:site1) {FactoryGirl.create(:site)}
    let(:site2) {FactoryGirl.create(:site)}
    
    it "checking for collection of last statistics" do
      expect(currency1.last_statistics).to eq []
    end

    it "when searching for data that is not present" do
      FactoryGirl.create(:stat_node, currency_id:currency2.id, site_id:site1.id)
      expect(currency1.last_statistics).to eq []
    end

    it "when there are multiple data for one site" do
      4.times do
        FactoryGirl.create(:stat_node, currency_id:currency1.id, site_id:site1.id)
      end
      allow(currency1).to receive(:sites).and_return(Site.all)
      expect(currency1.last_statistics).to eq [StatNode.last.id]
    end

    it "When there are multiple sites" do
      sn1 = FactoryGirl.create(:stat_node, currency_id:currency1.id, site_id:site1.id)
      sn2 = FactoryGirl.create(:stat_node, currency_id:currency1.id, site_id:site2.id)
      allow(currency1).to receive(:sites).and_return(Site.all)
      expect(currency1.last_statistics).to eq [sn1.id,sn2.id]
    end
  end

  context "checking validity of public methods counting current data" do

    let(:currency) {FactoryGirl.create(:currency)}
    let(:site1) {FactoryGirl.create(:site)}
    let(:site2) {FactoryGirl.create(:site)}
    let(:site3) {FactoryGirl.create(:site)}

    it "checking for validity of average value" do
      allow(currency).to receive(:sites).and_return(Site.all)  
      FactoryGirl.create(:stat_node, currency_id:currency.id, site_id:site1.id, sell_value: "3", buy_value: "1")
      FactoryGirl.create(:stat_node, currency_id:currency.id, site_id:site2.id, sell_value: "4", buy_value: "2")
      FactoryGirl.create(:stat_node, currency_id:currency.id, site_id:site3.id, sell_value: "5", buy_value: "3")
      currency.find_average_value

      expect(currency.average_value).to eq ((2+3+4)/3)
    end
    it "checking for validity of best buy and sell values" do
      allow(currency).to receive(:sites).and_return(Site.all)  
      statnode1 = FactoryGirl.create(:stat_node, currency_id:currency.id, site_id:site1.id, sell_value: "3", buy_value: "1")
      statnode2 = FactoryGirl.create(:stat_node, currency_id:currency.id, site_id:site2.id, sell_value: "4", buy_value: "2")
      statnode3 = FactoryGirl.create(:stat_node, currency_id:currency.id, site_id:site3.id, sell_value: "5", buy_value: "3")
      currency.set_best_value
        expect(currency.last_best_buy_statnode_id).to eq (statnode1.id)
        expect(currency.last_best_sell_statnode_id).to eq (statnode3.id)
    end
  end
end
