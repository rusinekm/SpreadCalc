class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def self.statnode_creator
    Currency.all.each do |currency| {
      currency.currency_sites.each do |currency_site|{
        # parsing site using claases provided
        new_node = StatNode.new() 
      }
    }
    
  end

  background_currency_data_parsing = Thread.new do
  sleep (DateTime.now - StatNode.last.created_at), if StatNode.last && (DateTime.now - StatNode.last.created_at) <= 3.hours
    while true do
      statnode_creator
      sleep 3.hours
    end
  end
end
end
