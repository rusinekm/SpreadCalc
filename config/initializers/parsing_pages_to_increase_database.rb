require 'open-uri'
Currency.establish_connection 
CurrencySite.establish_connection 
Site.establish_connection
StatNode.establish_connection

def statnode_creator
  Site.all.each do |current_site| 
    parsing_page = Thread.new do
      page = Nokogiri(open(current_site.url))
        current_site.currency_sites.each do |current_currency_site|
          buy_value = current_currency_site.parse_buy_value(page)
          sell_value = current_currency_site.parse_sell_value(page)
          StatNode.create(currency_id: current_currency_site.currency_id, site_id: current_currency_site.site_id, buy_value: buy_value, sell_value: sell_value)  
      end
    end
  end
  
 find_average_values
 set_best_values
end

def find_average_values
  Currency.all.each {|currency| currency.find_average_value}
end

def set_best_values
  Currency.all.each {|currency| currency.set_best_value}
end
  
background_currency_data_parsing = Thread.new do 
  # sleep 55.seconds #used to wait for the server to start
  if (StatNode.last && (Time.now - StatNode.last.created_at) <= 5.minutes) then
    sleep (5.minutes - (Time.now - StatNode.last.created_at))
  end
  while true do
    thread_collecting_website_data = Thread.new do
      statnode_creator
    end
    sleep 5.minutes
  end
end
