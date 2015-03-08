class Site < ActiveRecord::Base
  validates :name, :url, presence: true
  validates :url, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/}
  
  before_destroy :destroy_currency_sites

  has_many :currency_sites
  has_many :currencies, through: :currency_sites
  has_many :stat_nodes

  def buy_value(currency_id)
    node = find_right_node(currency_id)
    if node then
      node.buy_value
    else
      "no data yet"
    end
  end

  def sell_value(currency_id)
    node = find_right_node(currency_id)
    if node then
      node.sell_value
    else
      "no data yet"
    end
  end

  private

  def destroy_currency_sites
    CurrencySite.delete_all(site_id: id)
    StatNode.delete_all(site_id: id)
    Currency.all.each {|currency| currency.destroy_if_empty}
  end  

  def find_right_node(currency_id)
    stat_nodes.where(currency_id: currency_id).last
  end
end
