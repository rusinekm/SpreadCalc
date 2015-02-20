class Site < ActiveRecord::Base
  validates :name, :url, presence: true

end
