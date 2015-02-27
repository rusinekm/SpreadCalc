require 'open-uri'
ActiveRecord::Currency.establish_connection Rails.env
ActiveRecord::CurrencySite.establish_connection Rails.env
ActiveRecord::Site.establish_connection Rails.env
ActiveRecord::StatNode.establish_connection Rails.env

def statnode_creator
  Site.all.each do |current_site| 
    page = Nokogiri(open(current_site.url))
    current_site.currency_sites.each do |current_currency_site|
      buy_value = current_currency_site.parse_buy_value(page)
      sell_value = current_currency_site.parse_sell_value(page)
      StatNode.create(currency_id: current_currency_site.currency_id, site_id: current_currency_site.site_id, buy_value: buy_value, sell_value: sell_value)  
    end
 end
 puts "teraz wrzucamy srednie"
 find_average_values
end

def find_average_values
  Currency.all.each {|currency| currency.find_average_value}
end

background_currency_data_parsing = Thread.new do 
  sleep 15.seconds #used to wait for the server to start
  if (StatNode.last && (DateTime.now - StatNode.last.created_at) <= 5.minutes) then
    sleep (DateTime.now - StatNode.last.created_at) 
  end
  while true do
    statnode_creator
    sleep 5.minutes
  end
end
