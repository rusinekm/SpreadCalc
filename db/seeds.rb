
kantor_internetowy = Site.create(name:"kantor_internetowy", url: "https://internetowykantor.pl/")
# kantor_online =      Site.create(name:"KantorOnline.pl", url: "https://kantoronline.pl/")


eur = Currency.create(name: "Euro")
chf = Currency.create(name: "Swiss Frank")
usd = Currency.create(name: "US Dollar")

# seeds for kantor_internetowy site
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: eur.id, currency_class: "#waluta-EUR", buy_parsing_class:"page.css('#waluta-EUR').css('.kurs_kupna').text.gsub(',','.').to_f", sell_parsing_class:"page.css('#waluta-EUR').css('.kurs_sprzedazy').text.gsub(',','.').to_f")
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: chf.id, currency_class: "#waluta-CHF", buy_parsing_class:"page.css('#waluta-CHF').css('.kurs_kupna').text.gsub(',','.').to_f", sell_parsing_class:"page.css('#waluta-CHF').css('.kurs_sprzedazy').text.gsub(',','.').to_f")
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: usd.id, currency_class: "#waluta-USD", buy_parsing_class:"page.css('#waluta-USD').css('.kurs_kupna').text.gsub(',','.').to_f", sell_parsing_class:"page.css('#waluta-USD').css('.kurs_sprzedazy').text.gsub(',','.').to_f")

# seeds for kantor_online site
# CurrencySite.create(site_id: kantor_online.id, currency_id: eur.id, currency_class: "#eur", buy_parsing_class:"#eurbuy", sell_parsing_class:"#eursell")
# CurrencySite.create(site_id: kantor_online.id, currency_id: chf.id, currency_class: "#chf", buy_parsing_class:"#chfbuy", sell_parsing_class:"#chfsell")
# CurrencySite.create(site_id: kantor_online.id, currency_id: usd.id, currency_class: "#usd", buy_parsing_class:"#usdbuy", sell_parsing_class:"#usdsell")
