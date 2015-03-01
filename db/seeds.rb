#site seeds
kantor_internetowy = Site.create(name:"kantor internetowy", url: "https://internetowykantor.pl/")
cinkciarz = Site.create(name: "cinkciarz.pl", url: "https://cinkciarz.pl")
kantor_pl = Site.create(name: "kantor.pl", url: "http://www.kantor.pl/")
kantorwarszawa = Site.create(name: "kantor Warszawa", url: "http://www.kantorwarszawa.pl/")
pewnykantor = Site.create(name: "pewny kantor", url: "https://pewnykantor.pl/")
kantor77 = Site.create(name: "kantor 77", url: "https://kantor77.pl/")
monero = Site.create(name: "monero.pl", url: "https://monero.pl/")
lider_walut = Site.create(name: "lider walut", url: "https://liderwalut.pl/")
kantor_max = Site.create(name: "internetowy kantor MAX", url: "https://internetowykantormax.pl/")
kantor_darex = Site.create(name: "kantor Darex", url: "https://www.kantordarex.pl")
meritum_bank = Site.create(name: "Meritum bank", url: "http://meritumbank.pl/finanse_osobiste/e-kantor/e-kantor.html")
kantoria_pl = Site.create(name: "kantoria.pl", url: "https://www.kantoria.com/")

# currency seeds
eur = Currency.create(name: "Euro")
chf = Currency.create(name: "Swiss Frank")
usd = Currency.create(name: "US Dollar")
gbp = Currency.create(name: "British Pound")

# seeds for kantor_internetowy site
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: eur.id, buy_parsing_css:"css('#waluta-EUR').css('.kurs_kupna').text", sell_parsing_css:"css('#waluta-EUR').css('.kurs_sprzedazy').text")
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: chf.id, buy_parsing_css:"css('#waluta-CHF').css('.kurs_kupna').text", sell_parsing_css:"css('#waluta-CHF').css('.kurs_sprzedazy').text")
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: usd.id, buy_parsing_css:"css('#waluta-USD').css('.kurs_kupna').text", sell_parsing_css:"css('#waluta-USD').css('.kurs_sprzedazy').text")
CurrencySite.create(site_id: kantor_internetowy.id, currency_id: gbp.id, buy_parsing_css:"css('#waluta-GBP').css('.kurs_kupna').text", sell_parsing_css:"css('#waluta-GBP').css('.kurs_sprzedazy').text")

# seeds for cinkciarz site
CurrencySite.create(site_id: cinkciarz.id, currency_id: eur.id, buy_parsing_css:"css('span[title=\"Euro\"]').first.parent.parent.css('td')[1].text", sell_parsing_css:"css('span[title=\"Euro\"]').first.parent.parent.css('td')[2].text")
CurrencySite.create(site_id: cinkciarz.id, currency_id: chf.id, buy_parsing_css:"css('span[title=\"Frank szwajcarski\"]').first.parent.parent.css('td')[1].text", sell_parsing_css:"css('span[title=\"Frank szwajcarski\"]').first.parent.parent.css('td')[2].text")
CurrencySite.create(site_id: cinkciarz.id, currency_id: usd.id, buy_parsing_css:"css('span[title=\"Dolar amerykański\"]').first.parent.parent.css('td')[1].text", sell_parsing_css:"css('span[title=\"Dolar amerykański\"]').first.parent.parent.css('td')[2].text")
CurrencySite.create(site_id: cinkciarz.id, currency_id: gbp.id, buy_parsing_css:"css('span[title=\"Funt brytyjski\"]').first.parent.parent.css('td')[1].text", sell_parsing_css:"css('span[title=\"Funt brytyjski\"]').first.parent.parent.css('td')[2].text")

# seeds for kantor.pl site
CurrencySite.create(site_id: kantor_pl.id, currency_id: eur.id, buy_parsing_css:"css('a[title=\"Kursy walut - EURO\"]').first.parent.parent.css('td')[3].text", sell_parsing_css:"css('a[title=\"Kursy walut - EURO\"]').first.parent.parent.css('td')[4].text")
CurrencySite.create(site_id: kantor_pl.id, currency_id: chf.id, buy_parsing_css:"css('a[title=\"Kursy walut - Frank Szwajcarski\"]').first.parent.parent.css('td')[3].text", sell_parsing_css:"css('a[title=\"Kursy walut - Frank Szwajcarski\"]').first.parent.parent.css('td')[4].text")
CurrencySite.create(site_id: kantor_pl.id, currency_id: usd.id, buy_parsing_css:"css('a[title=\"Kursy walut - Dolar Amerykański\"]').first.parent.parent.css('td')[3].text", sell_parsing_css:"css('a[title=\"Kursy walut - Dolar Amerykański\"]').first.parent.parent.css('td')[4].text")
CurrencySite.create(site_id: kantor_pl.id, currency_id: gbp.id, buy_parsing_css:"css('a[title=\"Kursy walut - Funt Brytyjski\"]').first.parent.parent.css('td')[3].text", sell_parsing_css:"css('a[title=\"Kursy walut - Funt Brytyjski\"]').first.parent.parent.css('td')[4].text")

#seeds for kantor warszawa site
CurrencySite.create(site_id: kantorwarszawa.id, currency_id: eur.id, buy_parsing_css:"css('img[title=\"kantor flaga Unii Europejskiej\"]').first.parent.parent.css('td')[5].text", sell_parsing_css:"css('img[title=\"kantor flaga Unii Europejskiej\"]').first.parent.parent.css('td')[6].text")
CurrencySite.create(site_id: kantorwarszawa.id, currency_id: chf.id, buy_parsing_css:"css('img[title=\"kantor flaga Szwajcarii\"]').first.parent.parent.css('td')[5].text", sell_parsing_css:"css('img[title=\"kantor flaga Szwajcarii\"]').first.parent.parent.css('td')[6].text")
CurrencySite.create(site_id: kantorwarszawa.id, currency_id: usd.id, buy_parsing_css:"css('img[title=\"kantor flaga USA\"]').first.parent.parent.css('td')[5].text", sell_parsing_css:"css('img[title=\"kantor flaga USA\"]').first.parent.parent.css('td')[6].text")
CurrencySite.create(site_id: kantorwarszawa.id, currency_id: gbp.id, buy_parsing_css:"css('img[title=\"kantor flaga Wielkiej Brytanii\"]').first.parent.parent.css('td')[5].text", sell_parsing_css:"css('img[title=\"kantor flaga Wielkiej Brytanii\"]').first.parent.parent.css('td')[6].text")

# seeds for pewny kantor site
CurrencySite.create(site_id: pewnykantor.id, currency_id: eur.id, buy_parsing_css:"css('#EUR_k').text", sell_parsing_css:"css('#EUR_s').text")
CurrencySite.create(site_id: pewnykantor.id, currency_id: chf.id, buy_parsing_css:"css('#CHF_k').text", sell_parsing_css:"css('#CHF_s').text")
CurrencySite.create(site_id: pewnykantor.id, currency_id: usd.id, buy_parsing_css:"css('#USD_k').text", sell_parsing_css:"css('#USD_s').text")
CurrencySite.create(site_id: pewnykantor.id, currency_id: gbp.id, buy_parsing_css:"css('#GBP_k').text", sell_parsing_css:"css('#GBP_s').text")

#seeds for kantor 77 site
CurrencySite.create(site_id: kantor77.id, currency_id: eur.id, buy_parsing_css:"css('.cur-value')[0].text.split(' ')[0]", sell_parsing_css:"css('.cur-value')[0].text.split(' ')[2]")
CurrencySite.create(site_id: kantor77.id, currency_id: chf.id, buy_parsing_css:"css('.cur-value')[1].text.split(' ')[0]", sell_parsing_css:"css('.cur-value')[1].text.split(' ')[2]")
CurrencySite.create(site_id: kantor77.id, currency_id: usd.id, buy_parsing_css:"css('.cur-value')[5].text.split(' ')[0]", sell_parsing_css:"css('.cur-value')[5].text.split(' ')[2]")
CurrencySite.create(site_id: kantor77.id, currency_id: gbp.id, buy_parsing_css:"css('.cur-value')[4].text.split(' ')[0]", sell_parsing_css:"css('.cur-value')[4].text.split(' ')[2]")

#seeds for monero.pl site
CurrencySite.create(site_id: monero.id, currency_id: eur.id, buy_parsing_css:"css('table').css('tr')[1].css('td')[2].text", sell_parsing_css:"css('table').css('tr')[1].css('td')[4].text")
CurrencySite.create(site_id: monero.id, currency_id: chf.id, buy_parsing_css:"css('table').css('tr')[4].css('td')[2].text", sell_parsing_css:"css('table').css('tr')[4].css('td')[4].text")
CurrencySite.create(site_id: monero.id, currency_id: usd.id, buy_parsing_css:"css('table').css('tr')[2].css('td')[2].text", sell_parsing_css:"css('table').css('tr')[2].css('td')[4].text")
CurrencySite.create(site_id: monero.id, currency_id: gbp.id, buy_parsing_css:"css('table').css('tr')[3].css('td')[2].text", sell_parsing_css:"css('table').css('tr')[3].css('td')[4].text")

#seeds for lider walut site
CurrencySite.create(site_id: lider_walut.id, currency_id: eur.id, buy_parsing_css:"css('.EUR').css('.bid').text", sell_parsing_css:"css('.EUR').css('.ask').text")
CurrencySite.create(site_id: lider_walut.id, currency_id: chf.id, buy_parsing_css:"css('.CHF').css('.bid').text", sell_parsing_css:"css('.CHF').css('.ask').text")
CurrencySite.create(site_id: lider_walut.id, currency_id: usd.id, buy_parsing_css:"css('.USD').css('.bid').text", sell_parsing_css:"css('.USD').css('.ask').text")
CurrencySite.create(site_id: lider_walut.id, currency_id: gbp.id, buy_parsing_css:"css('.GBP').css('.bid').text", sell_parsing_css:"css('.GBP').css('.ask').text")

#seeds for kantor max site
CurrencySite.create(site_id: kantor_max.id, currency_id: eur.id, buy_parsing_css:"css('#EUR_k').text", sell_parsing_css:"css('#EUR_s').text")
CurrencySite.create(site_id: kantor_max.id, currency_id: chf.id, buy_parsing_css:"css('#CHF_k').text", sell_parsing_css:"css('#CHF_s').text")
CurrencySite.create(site_id: kantor_max.id, currency_id: usd.id, buy_parsing_css:"css('#USD_k').text", sell_parsing_css:"css('#USD_s').text")
CurrencySite.create(site_id: kantor_max.id, currency_id: gbp.id, buy_parsing_css:"css('#GBP_k').text", sell_parsing_css:"css('#GBP_s').text")

#seeds for kantor darex site
CurrencySite.create(site_id: kantor_darex.id, currency_id: eur.id, buy_parsing_css:"css('img[title=\"Euro\"]')[0].parent.parent.css('td')[4].text", sell_parsing_css:"css('img[title=\"Euro\"]')[0].parent.parent.css('td')[6].text")
CurrencySite.create(site_id: kantor_darex.id, currency_id: chf.id, buy_parsing_css:"css('img[title=\"Frank szwajcarski\"]')[0].parent.parent.css('td')[4].text", sell_parsing_css:"css('img[title=\"Frank szwajcarski\"]')[0].parent.parent.css('td')[6].text")
CurrencySite.create(site_id: kantor_darex.id, currency_id: usd.id, buy_parsing_css:"css('img[title=\"Dolar amerykański\"]')[0].parent.parent.css('td')[4].text", sell_parsing_css:"css('img[title=\"Dolar amerykański\"]')[0].parent.parent.css('td')[6].text")
CurrencySite.create(site_id: kantor_darex.id, currency_id: gbp.id, buy_parsing_css:"css('img[title=\"Funt szterling\"]')[0].parent.parent.css('td')[4].text", sell_parsing_css:"css('img[title=\"Funt szterling\"]')[0].parent.parent.css('td')[6].text")

#seeds for meritum bank site
CurrencySite.create(site_id: meritum_bank.id, currency_id: eur.id, buy_parsing_css:"css('#currency_table').css('tr')[1].css('td')[1].text", sell_parsing_css:"css('#currency_table').css('tr')[1].css('td')[2].text")
CurrencySite.create(site_id: meritum_bank.id, currency_id: chf.id, buy_parsing_css:"css('#currency_table').css('tr')[3].css('td')[1].text", sell_parsing_css:"css('#currency_table').css('tr')[3].css('td')[2].text")
CurrencySite.create(site_id: meritum_bank.id, currency_id: usd.id, buy_parsing_css:"css('#currency_table').css('tr')[2].css('td')[1].text", sell_parsing_css:"css('#currency_table').css('tr')[2].css('td')[2].text")
CurrencySite.create(site_id: meritum_bank.id, currency_id: gbp.id, buy_parsing_css:"css('#currency_table').css('tr')[4].css('td')[1].text", sell_parsing_css:"css('#currency_table').css('tr')[4].css('td')[2].text")

#seeds for kantoria.pl site
CurrencySite.create(site_id: kantoria_pl.id, currency_id: eur.id, buy_parsing_css:"css('.eur')[0].parent.css('.value')[0].text", sell_parsing_css:"css('.eur')[0].parent.css('.value')[1].text")
CurrencySite.create(site_id: kantoria_pl.id, currency_id: chf.id, buy_parsing_css:"css('.chf')[0].parent.css('.value')[0].text", sell_parsing_css:"css('.chf')[0].parent.css('.value')[1].text")
CurrencySite.create(site_id: kantoria_pl.id, currency_id: usd.id, buy_parsing_css:"css('.usd')[0].parent.css('.value')[0].text", sell_parsing_css:"css('.usd')[0].parent.css('.value')[1].text")
CurrencySite.create(site_id: kantoria_pl.id, currency_id: gbp.id, buy_parsing_css:"css('.gbp')[0].parent.css('.value')[0].text", sell_parsing_css:"css('.gbp')[0].parent.css('.value')[1].text")
