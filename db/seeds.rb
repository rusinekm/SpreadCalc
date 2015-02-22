
kantor_internetowy = Site.create(name:"kantor_internetowy", url: "https://internetowykantor.pl/")

eur = Currency.create(name: "Euro")
chf = Currency.create(name: "Swiss Frank")
usd = Currency.create(name: "US Dollar")

CurrencySite.create(site_id: kantor_internetowy.id, currency_id: eur.id, currency_class: "#waluta-EUR", buy_parsing_class:".kurs_kupna", sell_parsing_class:".kurs_sprzedazy")
# CurrencySite.Create(site_id: kantor_internetowy.id, currency_id: chf.id, buy_parsing_class:".kurs_kupna", sell_parsing_class:".kurs_sprzedazy")
# CurrencySite.Create(site_id: kantor_internetowy.id, currency_id: usd.id, buy_parsing_class:".kurs_kupna", sell_parsing_class:".kurs_sprzedazy")
