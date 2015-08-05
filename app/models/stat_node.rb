class StatNode < ActiveRecord::Base
 
  validates :sell_value, :buy_value, presence: true

  before_create :is_sell_value_is_greater_than_buy_value?
  before_create :assign_spread_and_net_values

  belongs_to :site
  belongs_to :currency

  def self.delete_stat_nodes_older_than_day
    StatNode.delete_all(["created_at < ?", 1.day.ago])
  end

  private

  def self.time_of_last_node
    if StatNode.last then
      StatNode.last.created_at
    else 
      "no data yet."
    end
  end

  def is_sell_value_is_greater_than_buy_value?
    sell_value > buy_value
  end

  def assign_spread_and_net_values
    self.spread_value = sell_value - buy_value
    self.net_worth = sell_value - (spread_value/2)
    sell_value > buy_value
  end


end
