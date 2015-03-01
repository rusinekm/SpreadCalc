class StatNode < ActiveRecord::Base
 
  validates :sell_value, :buy_value, presence: true

  before_validation :check_if_sell_value_is_greater_than_buy_value, on: :create

  before_create :assign_spread_and_net_values

  belongs_to :site
  belongs_to :currency

  private

  def check_if_sell_value_is_greater_than_buy_value
    sell_value > buy_value
  end

  def assign_spread_and_net_values
    self.spread_value = sell_value - buy_value
    self.net_worth = sell_value - (spread_value/2)
    sell_value > buy_value
  end


end
