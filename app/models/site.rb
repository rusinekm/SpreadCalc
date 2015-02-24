class Site < ActiveRecord::Base
  validates :name, :url, presence: true

  has_many :currency_sites
  has_many :currencies, through: :currency_sites
  has_many :stat_nodes

  def show_link_to_page
    "<%= link_to #{name}, #{url}>"
  end

end
