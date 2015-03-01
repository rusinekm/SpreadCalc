require 'open-uri'
class CurrencySite < ActiveRecord::Base

  validates :site_id, :currency_id, :buy_parsing_css, :sell_parsing_css, presence: true

  before_validation :check_if_provided_css_is_numerical, on: :create

  belongs_to :currency
  belongs_to :site 

  def parse_buy_value(page)
    eval("page.#{buy_parsing_css}.gsub(',','.').to_f;")
  end

  def parse_sell_value(page)
    eval("page.#{sell_parsing_css}.gsub(',','.').to_f;")
  end

  private
  def check_if_css_is_not_another_code
    buy_parsing_css.split(' ').count == 1 && sell_parsing_css.split(' ').count == 1
  end

  def check_if_provided_css_is_numerical
    page = Nokogiri(open(site.url))
    parse_buy_value(page) != 0 && parse_sell_value(page) != 0
  end

  def checking_corectness_of_inputs
    check_if_css_is_not_another_code && check_if_provided_css_is_numerical
  end
end
 