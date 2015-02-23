class Currency < ActiveRecord::Base

  validates :name, presence: true

  has_many :currency_sites
  has_many :sites, through: :currency_sites
  has_many :stat_nodes



  def current_buy_value
    if last_statistics != [] then
      StatNode.where(id: last_statistics).order(:buy_value).first.buy_value
    else
      "no data"
    end
  end

  def current_sell_value
   if last_statistics != [] then
    StatNode.where(id: last_statistics).order(:sell_value).last.sell_value
  else
    "no data"
  end
end

def current_worth
 if last_statistics != [] then
  StatNode.where(id: last_statistics).order(:net_worth).last.net_worth
else
  "no data"
end
end

def current_office
  if last_statistics != [] then
    StatNode.where(id: last_statistics).order(:buy_value).first.site.name
  else
    "no data"
  end
end

def last_statistics
  temp_array=[]
  sites.each do |site|
    temp_array << StatNode.where("site_id = #{site.id} AND currency_id = #{id}").last.id
  end

  temp_array
end
end
