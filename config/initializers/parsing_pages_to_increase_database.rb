ActiveRecord::Currency.establish_connection Rails.env
ActiveRecord::CurrencySite.establish_connection Rails.env
ActiveRecord::Site.establish_connection Rails.env
ActiveRecord::StatNode.establish_connection Rails.env

def statnode_creator
  Currency.all.each do |current_currency| 
    current_currency.currency_sites.each do |current_currency_site|
      buy_value = current_currency_site.parse_buy_value
      sell_value = current_currency_site.parse_sell_value
      StatNode.create(currency_id: current_currency_site.currency_id, site_id: current_currency_site.site_id, buy_value: buy_value, sell_value: sell_value)  
   end
 end
end

background_currency_data_parsing = Thread.new do 
  sleep 5.seconds
  sleep (DateTime.now - StatNode.last.created_at), if StatNode.last && (DateTime.now - StatNode.last.created_at) <= 15.minutes
  while true do
    statnode_creator
    sleep 30.seconds
  end
end
