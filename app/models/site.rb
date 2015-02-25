class Site < ActiveRecord::Base
  validates :name, :url, presence: true

  has_many :currency_sites
  has_many :currencies, through: :currency_sites
  has_many :stat_nodes

  def buy_value
    if stat_nodes.last then
      stat_nodes.last.buy_value
    else
      "no data yet"
    end
  end

  def sell_value
    if stat_nodes.last then
      stat_nodes.last.sell_value
    else
      "no data yet"
    end
  end
end
