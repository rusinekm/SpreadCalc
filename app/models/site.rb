class Site < ActiveRecord::Base
  validates :name, :url, presence: true

  has_many :currency_sites
  has_many :currencies, through: :currency_sites
  has_many :stat_nodes

end
