

class CurrencySite < ActiveRecord::Base

  validates :buy_parsing_class, :sell_parsing_class, presence: true

  belongs_to :currency
  belongs_to :site 

  def parse_buy_value(page)
    eval("page.#{buy_parsing_class}.text.gsub(',','.').to_f;")
  end

  def parse_sell_value(page)
    eval("page.#{sell_parsing_class}.text.gsub(',','.').to_f;")
  end
end
 