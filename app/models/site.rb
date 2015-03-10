class Site < ActiveRecord::Base
  validates :name, :url, presence: true
  validates :url, url: true
  
  before_destroy :destroy_currency_sites

  has_many :currency_sites
  has_many :currencies, through: :currency_sites
  has_many :stat_nodes

  def self.parse_new_data
    Site.all.each do |current_site| 
        page = Nokogiri(open(current_site.url))
        current_site.currency_sites.each do |current_currency_site|
          StatNode.create(currency_id: current_currency_site.currency_id, site_id: current_site.id, buy_value: current_currency_site.parse_buy_value(page), sell_value: current_currency_site.parse_sell_value(page))  
        end
    end
    Currency.find_best_values
  end

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
    Currency.destroy_if_empty
    Currency.find_best_values
  end  

  def find_right_node(currency_id)
    stat_nodes.where(currency_id: currency_id).last
  end
end
