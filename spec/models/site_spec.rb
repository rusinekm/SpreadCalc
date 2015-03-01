require 'rails_helper'

RSpec.describe Site, type: :model do
  context "checking validity of public methods" do
    let(:site) {FactoryGirl.create(:site)}
    let(:currency) {FactoryGirl.create(:currency)}

    it "when there haven't been any records" do
      expect(site.buy_value(currency.id)).to eq "no data yet"
      expect(site.sell_value(currency.id)).to eq "no data yet"
    end

    it "when there is one record" do
      stat_node = FactoryGirl.create(:stat_node, site_id: site.id, currency_id: currency.id)
      expect(site.buy_value(currency.id)).to eq stat_node.buy_value
    end

    it "when there are many records" do
      4.times do
        FactoryGirl.create(:stat_node, site_id: site.id, currency_id: currency.id)
      end
      stat_node = FactoryGirl.create(:stat_node, site_id: site.id, currency_id: currency.id, buy_value: "0.5")   
      expect(site.buy_value(currency.id)).to eq stat_node.buy_value
      expect(site.buy_value(currency.id)).not_to eq StatNode.first.buy_value
    end
  end  
end
