class StatNode < ActiveRecord::Base
 
  validates :sell_value, :buy_value, presence: true

  before_create :assign_spread_and_net_values

  belongs_to :site
  belongs_to :currency

  private

  def assign_spread_and_net_values
    spread = sell_value - buy_value
    net_worth = sell_value - (spread/2)
  end


end
