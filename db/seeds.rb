#site seeds
kantor_internetowy = Site.create(name:"kantor_internetowy", url: "https://internetowykantor.pl/")
cinkciarz = Site.create(name: "cinkciarz.pl", url: "https://cinkciarz.pl")
kantor_pl = Site.create(name: "kantor.pl", url: "http://www.kantor.pl/")
kantorwarszawa = Site.create(name: "kantor Warszawa", url: "http://www.kantorwarszawa.pl/")

# currency seeds
eur = Currency.create(name: "Euro")
chf = Currency.create(name: "Swiss Frank")
usd = Currency.create(name: "US Dollar")

# seeds for kantor_internetowy site
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: eur.id, buy_parsing_class:"css('#waluta-EUR').css('.kurs_kupna')", sell_parsing_class:"css('#waluta-EUR').css('.kurs_sprzedazy')")
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: chf.id, buy_parsing_class:"css('#waluta-CHF').css('.kurs_kupna')", sell_parsing_class:"css('#waluta-CHF').css('.kurs_sprzedazy')")
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: usd.id, buy_parsing_class:"css('#waluta-USD').css('.kurs_kupna')", sell_parsing_class:"css('#waluta-USD').css('.kurs_sprzedazy')")

# seeds for cinkciarz site
CurrencySite.create(site_id: cinkciarz.id, currency_id: eur.id, buy_parsing_class:"css('span[title=\"Euro\"]').first.parent.parent.css('td')[1]", sell_parsing_class:"css('span[title=\"Euro\"]').first.parent.parent.css('td')[2]")
CurrencySite.create(site_id: cinkciarz.id, currency_id: chf.id, buy_parsing_class:"css('span[title=\"Frank szwajcarski\"]').first.parent.parent.css('td')[1]", sell_parsing_class:"css('span[title=\"Frank szwajcarski\"]').first.parent.parent.css('td')[2]")
CurrencySite.create(site_id: cinkciarz.id, currency_id: usd.id, buy_parsing_class:"css('span[title=\"Dolar amerykański\"]').first.parent.parent.css('td')[1]", sell_parsing_class:"css('span[title=\"Dolar amerykański\"]').first.parent.parent.css('td')[2]")

# seeds for kantor.pl site
CurrencySite.create(site_id: kantor_pl.id, currency_id: eur.id, buy_parsing_class:"css('a[title=\"Kursy walut - EURO\"]').first.parent.parent.css('td')[3]", sell_parsing_class:"css('a[title=\"Kursy walut - EURO\"]').first.parent.parent.css('td')[4]")
CurrencySite.create(site_id: kantor_pl.id, currency_id: chf.id, buy_parsing_class:"css('a[title=\"Kursy walut - Frank Szwajcarski\"]').first.parent.parent.css('td')[3]", sell_parsing_class:"css('a[title=\"Kursy walut - Frank Szwajcarski\"]').first.parent.parent.css('td')[4]")
CurrencySite.create(site_id: kantor_pl.id, currency_id: usd.id, buy_parsing_class:"css('a[title=\"Kursy walut - Dolar Amerykański\"]').first.parent.parent.css('td')[3]", sell_parsing_class:"css('a[title=\"Kursy walut - Dolar Amerykański\"]').first.parent.parent.css('td')[4]")

#seeds for kantor warszawa site
CurrencySite.create(site_id: kantorwarszawa.id, currency_id: eur.id, buy_parsing_class:"css('img[title=\"kantor flaga Unii Europejskiej\"]').first.parent.parent.css('td')[5]", sell_parsing_class:"css('img[title=\"kantor flaga Unii Europejskiej\"]').first.parent.parent.css('td')[6]")
CurrencySite.create(site_id: kantorwarszawa.id, currency_id: chf.id, buy_parsing_class:"css('img[title=\"kantor flaga Szwajcarii\"]').first.parent.parent.css('td')[5]", sell_parsing_class:"css('img[title=\"kantor flaga Szwajcarii\"]').first.parent.parent.css('td')[6]")
CurrencySite.create(site_id: kantorwarszawa.id, currency_id: usd.id, buy_parsing_class:"css('img[title=\"kantor flaga USA\"]').first.parent.parent.css('td')[5]", sell_parsing_class:"css('img[title=\"kantor flaga USA\"]').first.parent.parent.css('td')[6]")
