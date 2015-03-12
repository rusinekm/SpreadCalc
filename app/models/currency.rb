class Currency < ActiveRecord::Base

  validates :name, presence: true

  has_many :currency_sites
  has_many :sites, through: :currency_sites
  has_many :stat_nodes

  def self.find_best_values
    Currency.all.each do |currency| 
      statnodes = currency.last_statistics
      currency.find_average_value(statnodes)
      currency.set_best_value(statnodes)
    end
  end

  def self.find_currency_id(currency_name)
    currency = Currency.where(name:currency_name)
    if currency then
      currency.id
    else
    currency = Currency.create(name: currency_name)
    currency.id
    end
  end

  def self.destroy_if_empty
    Currency.all.each do |currency|
      if currency.currency_sites = [] then
      currency.destroy
      end
    end
  end

  def last_best_buy_statnode
    StatNode.find(last_best_buy_statnode_id)
  end

  def last_best_sell_statnode
    StatNode.find(last_best_sell_statnode_id)
  end

  def last_statistics
    temp_array=[]
    sites.each do |site|
      if site.stat_nodes.where(currency_id: id) != [] then
        temp_array << site.stat_nodes.where(currency_id: id).last
      end
    end
    temp_array
  end

  def find_average_value(statnodes)
    if statnodes.count > 0 then
      self.average_value = stat_nodes.sum(:net_worth) / statnodes.count
    else
      self.average_value = 0
    end 
    save
  end

  def set_best_value(statnodes)
    if statnodes != [] then
      self.last_best_buy_statnode_id = current_buy_value_node(statnodes).id
      self.last_best_sell_statnode_id = current_sell_value_node(statnodes).id
    else
      self.last_best_buy_statnode_id = nil
      self.last_best_sell_statnode_id = nil
    end
    save
  end

  

  def current_buy_value_node(current_statistics)
    current_statistics.sort_by {|node| node.buy_value }.first
  end

  def current_sell_value_node(current_statistics)
    current_statistics.sort_by {| node| node.sell_value}.last
  end  
end
