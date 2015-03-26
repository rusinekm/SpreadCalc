require 'open-uri'
class CurrencySite < ActiveRecord::Base

  attr_accessor :currency_name, :site_name, :site_url, :new_site, :new_currency

  validates :site_id, :currency_id, :buy_parsing_css, :sell_parsing_css, presence: true

  before_validation :checking_corectness_of_inputs, on: [:create, :update]

  before_destroy :destroy_appropriate_stat_nodes

  belongs_to :currency
  belongs_to :site 

  def parse_buy_value(page)
    eval("page.#{buy_parsing_css}.gsub(',','.').to_f;")
  end

  def parse_sell_value(page)
    eval("page.#{sell_parsing_css}.gsub(',','.').to_f;")
  end

  private

  def self.such_connection_exists?(site_id, currency_id)
    !(CurrencySite.where("site_id = #{site_id} AND currency_id = #{currency_id}") == [])
  end
  
  def check_if_buying_parsing_code_is_right(page)
    if variable_might_have_other_commands(buy_parsing_css) && begginging_of_variable_if_css_selector(buy_parsing_css) then
      code_that_is_supposed_to_be_xml = buy_parsing_css.split('.text').first
      eval("(check_if_code_is_nokigiri_type(page, code_that_is_supposed_to_be_xml)) && (page.#{buy_parsing_css}.kind_of? String)") 
    else
      false
    end
  end

  def check_if_selling_parsing_code_is_right(page)
    if variable_might_have_other_commands(sell_parsing_css) && begginging_of_variable_if_css_selector(sell_parsing_css) then
      code_that_is_supposed_to_be_xml = sell_parsing_css.split('.text').first
      eval("(check_if_code_is_nokigiri_type(page, code_that_is_supposed_to_be_xml)) && (page.#{sell_parsing_css}.kind_of? String)") 
    else
      false
    end
  end

  def variable_might_have_other_commands(parsing_variable)
    parsing_variable.count(";") == 0 && parsing_variable.lines.count == 1
  end

  def begginging_of_variable_if_css_selector(parsing_variable)
    parsing_variable[0..2] == "css" || parsing_variable[0..6] == "at_css"
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
    print "."
    page = Nokogiri(open(site.url))
    check_if_css_is_not_another_code(page) && check_if_provided_css_is_numerical(page)
  end

  def destroy_appropriate_stat_nodes
    StatNode.delete_all(currency_id: currency_id, site_id: site_id)
  end
end
 