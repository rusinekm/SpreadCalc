class Currency < ActiveRecord::Base
  
  validates :name, presence: true

  has_many :currency_sites
  has_many :sites, through: :currency_sites
  has_many :stat_nodes



  def best_buy_choice
    Statnode.find(last_statistics).orderby(:buy_value).first
  end

  def best_sell_choice
    Statnode.find(last_statistics).orderby(:sell_value).last
  end

  private
  
  def last_statistics
    temp_array=[]
    sites.each do |site|
      temp_array += StatNode.where("site_id = #{site.id} AND currency_id = #{currency.id}").last.id
    end
    temp_array
  end
end
