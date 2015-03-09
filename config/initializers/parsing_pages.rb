require 'open-uri'
Currency.establish_connection 
CurrencySite.establish_connection 
Site.establish_connection
StatNode.establish_connection



background_currency_data_parsing = Thread.new do 
  if (StatNode.last && (Time.now - StatNode.last.created_at) <= 5.minutes) then
    sleep (5.minutes - (Time.now - StatNode.last.created_at))
  end
  while true do
    Thread.new do
      Site.parse_new_data
      Thread.kill(self)
    end
    sleep 5.minutes
  end
end


destroying_old_stat_nodes = Thread.new do
  # it happens at 4 am
  if Time.now.hour > 4 then
    sleep (28 - Time.now.hour).hours
  else
    sleep (4 - Time.now.hour).hours
  end
  while true do
    Thread.new do
      StatNode.delete_stat_nodes_older_than_day
      Thread.kill(self)
    end
    sleep 24.hours
  end
end
