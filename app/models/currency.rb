class Currency < ActiveRecord::Base

  validates :name, presence: true

  has_many :currency_sites
  has_many :sites, through: :currency_sites
  has_many :stat_nodes


  def find_average_value
    sum = 0
    statnodes = StatNode.where(id: last_statistics)
    statnodes.each do |node| 
      sum += node.net_worth
    end
    self.average_value = sum / statnodes.count
    save
  end

  def set_best_value
    statnodes = last_statistics
    self.last_best_buy_statnode_id = current_buy_value(statnodes).id
    self.last_best_sell_statnode_id = current_sell_value(statnodes).id
    save
  end

  def last_statistics
    temp_array=[]
    sites.each do |site|
      if StatNode.where("site_id = #{site.id} AND currency_id = #{id}") != [] then
        temp_array << StatNode.where("site_id = #{site.id} AND currency_id = #{id}").last.id
      end
    end
    temp_array
  end

  private 

  def current_buy_value(current_statistics)
    if current_statistics != [] then
      StatNode.where(id: current_statistics).order(:buy_value).first
    else
      "no data"
    end
  end

  def current_sell_value(current_statistics)
    if current_statistics != [] then
      StatNode.where(id: current_statistics).order(:sell_value).last
    else
      "no data"
    end
  end

  def current_worth(current_statistics)
    if current_statistics != [] then
      StatNode.where(id: current_statistics).order(:net_worth).last.net_worth
    else
    "no data"
    end
  end

  
end
