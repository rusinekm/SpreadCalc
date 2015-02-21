class CurrencySite < ActiveRecord::Base

  validates :buy_parsing_class, :sell_parsing_class, presence: true

  belongs_to :Currency
  belongs_to :Site 
end
 