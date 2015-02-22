require 'open-uri'

class CurrencySite < ActiveRecord::Base

  validates :buy_parsing_class, :sell_parsing_class, presence: true

  belongs_to :currency
  belongs_to :site 

  def parse_buy_value
    page = Nokogiri::HTML(open(site.url))   
    page.css(currency_class).css(buy_parsing_class).text.gsub(",",".").to_f
  end

  def parse_sell_value
    page = Nokogiri::HTML(open(site.url))   
    page.css(currency_class).css(sell_parsing_class).text.gsub(",",".").to_f
  end
end
 