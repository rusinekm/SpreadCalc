require 'open-uri'

background_currency_data_parsing = Thread.new do 
  if (StatNode.last && (Time.now - StatNode.last.created_at) <= 5.minutes) then
    sleep (5.minutes - (Time.now - StatNode.last.created_at))
  end
  while true do
    Thread.new do
      StatNode.connection_pool.with_connection do
        Currency.connection_pool.with_connection do
          Site.parse_new_data
        end
      end
      Thread.kill(self)
    end
    sleep 5.minutes
  end
end

destroying_old_stat_nodes_between_4_and_5_am = Thread.new do
  if Time.now.hour > 4 then
    sleep (28 - Time.now.hour).hours
  else
    sleep (4 - Time.now.hour).hours
  end
  while true do
    Thread.new do
      StatNode.connection_pool.with_connection do
        StatNode.delete_stat_nodes_older_than_day
      end
      Thread.kill(self)
    end
    sleep 24.hours
  end
end
