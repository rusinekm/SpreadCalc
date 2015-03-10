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
  
  def last_best_buy_statnode
    StatNode.find(last_best_buy_statnode_id)
  end

  def last_best_sell_statnode
    StatNode.find(last_best_sell_statnode_id)
  end

  def find_average_value(statnodes)
    if statnodes.count > 0 then
      self.average_value = StatNode.where(id:statnodes).sum(:net_worth) / statnodes.count
    else
      self.average_value = 0
    end 
    save
  end

  def set_best_value(statnodes)
    if statnodes != [] then
      self.last_best_buy_statnode_id = current_buy_value(statnodes).id
      self.last_best_sell_statnode_id = current_sell_value(statnodes).id
    else
      self.last_best_buy_statnode_id = nil
      self.last_best_sell_statnode_id = nil
    end
    save
  end

  def last_statistics
    temp_array=[]
    sites.each do |site|
      if stat_nodes.where(site_id: site.id) != [] then
        temp_array << stat_nodes.where(site_id: site.id).last.id
      end
    end
    temp_array
  end

  def self.find_currency_id(currency_name)
    Currency.all.each do |currency|
      if currency.name == currency_name then
        return currency.id
      end
    end
    currency = Currency.create(name: currency_name)
    currency.id
  end

  def self.destroy_if_empty
    Currency.all.each do |currency|
      if currency.currency_sites = [] then
      currency.destroy
      end
    end
  end

  private 

  def current_buy_value(current_statistics)
    StatNode.where(id: current_statistics).order(:buy_value).first
  end

  def current_sell_value(current_statistics)
    StatNode.where(id: current_statistics).order(:sell_value).last
  end

  def current_worth(current_statistics)
    StatNode.where(id: current_statistics).order(:net_worth).last.net_worth
  end

  
end
