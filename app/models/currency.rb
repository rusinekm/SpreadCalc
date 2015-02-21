class Currency < ActiveRecord::Base
  
  validates :name

  has_many :sites, though: :currency_sites
  has_many :stat_nodes
end
