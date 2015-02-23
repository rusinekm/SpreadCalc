require 'open-uri'

class CurrencySite < ActiveRecord::Base

  validates :buy_parsing_class, :sell_parsing_class, presence: true

  belongs_to :currency
  belongs_to :site 

  def parse_buy_value
    set_buy_parsing_method
    execute_parsing_method
    # page.css(currency_class).css(buy_parsing_class).text.gsub(",",".").to_f
  end

  def parse_sell_value   
    set_buy_parsing_method
    execute_parsing_method
    # page.css(currency_class).css(sell_parsing_class).text.gsub(",",".").to_f
  end

  private

  def set_buy_parsing_method
    eval("def execute_parsing_method; page = Nokogiri(open(site.url)); #{buy_parsing_class}; end;")
  end

  def set_sell_parsing_method
    eval("def execute_parsing_method; page = Nokogiri(open(site.url)); #{sell_parsing_class}; end;")
  end

  def execute_parsing_method
    # code here is written by eval
  end
end
 