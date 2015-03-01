require 'rails_helper'

RSpec.describe StatNode, type: :model do
  context "checking custom validations" do

    it "when data are correct and validation should pass" do
      expect(FactoryGirl.build(:stat_node, buy_value: 1, sell_value: 4)).to be_valid
    end

    it "when data are not correct and validation should not pass" do
      expect(FactoryGirl.build(:stat_node, buy_value: 1, sell_value: 1)).not_to be_valid
    end
  end

  context "checking correctness of values set by callbacks" do
    it "checking if spread value is properly assigned" do
      statnode = FactoryGirl.create(:stat_node, buy_value: 1, sell_value: 4)
      expect(statnode.spread_value).to eq 3
    end

    it "checking if net value is properly assigned" do
      statnode = FactoryGirl.create(:stat_node, buy_value: 1, sell_value: 4)
      expect(statnode.net_worth).to eq 2.5
    end
  end
end
