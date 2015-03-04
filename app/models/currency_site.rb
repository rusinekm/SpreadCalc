require 'open-uri'
class CurrencySite < ActiveRecord::Base

  validates :site_id, :currency_id, :buy_parsing_css, :sell_parsing_css, presence: true

  before_validation :checking_corectness_of_inputs, on: :create

  belongs_to :currency
  belongs_to :site 

  def parse_buy_value(page)
    eval("page.#{buy_parsing_css}.gsub(',','.').to_f;")
  end

  def parse_sell_value(page)
    eval("page.#{sell_parsing_css}.gsub(',','.').to_f;")
  end

  private
  def check_if_buying_parsing_code_is_right(page)
    if buy_parsing_css[0..2] == "css" || buy_parsing_css[0..6] == "at_css" then
      code_that_is_supposed_to_be_xml = buy_parsing_css.split('.text').first
      eval("(check_if_code_is_nokigiri_type(page, code_that_is_supposed_to_be_xml)) && (page.#{buy_parsing_css}.kind_of? String)") 
    else
      false
    end
  end

    def check_if_selling_parsing_code_is_right(page)
    if sell_parsing_css[0..2] == "css" || sell_parsing_css[0..6] == "at_css" then
      code_that_is_supposed_to_be_xml = sell_parsing_css.split('.text').first
      eval("(check_if_code_is_nokigiri_type(page, code_that_is_supposed_to_be_xml)) && (page.#{sell_parsing_css}.kind_of? String)") 
    else
      false
    end
  end

  def check_if_code_is_nokigiri_type(page,xml_code_string)
    eval("(page.#{xml_code_string}.kind_of? Nokogiri::XML::Element) || (page.#{xml_code_string}.kind_of? Nokogiri::XML::NodeSet)")
  end

  def check_if_css_is_not_another_code(page)
    check_if_buying_parsing_code_is_right(page) && check_if_selling_parsing_code_is_right(page)
  end

  def check_if_provided_css_is_numerical(page)
    parse_buy_value(page) != 0 && parse_sell_value(page) != 0
  end

  def checking_corectness_of_inputs
    page = Nokogiri(open(site.url))
    check_if_css_is_not_another_code(page) && check_if_provided_css_is_numerical(page)
  end
end
 