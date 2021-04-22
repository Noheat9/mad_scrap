require 'open-uri'
require 'nokogiri'
require 'rubygems'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))  


crypto_name = Array.new(page.xpath('//tr/td[2]//a[contains(@href, "currencies")]'))
crypto_price = Array.new(page.xpath('//tr/td[5]//a[contains(@href, "markets")]'))

crypto_name_text = []
crypto_price_text = []

crypto_price.each do |crypto_price|
  crypto_price_text << crypto_price.text 
end

crypto_name.each do |crypto_name|
  crypto_name_text << crypto_name.text 
end

global = Hash[crypto_name_text.zip(crypto_price_text)]
puts global

=begin
  def scraping(url)
    html = URI.open("#{url}").read
    nokogiri_doc = Nokogiri::HTML(html)
    currency_name = []
    currency_price = []

    nokogiri_doc.search('//tr/td[2]//a[contains(@href, "currencies")]'.each do |element|
      element = element.text
      currency_name << element
    end

    nokogiri_doc.search('//tr/td[5]//a[contains(@href, "markets")]').each do |price|
      price = price.text[1..-1]
      currency_price << price
    end
  end

scraping('https://coinmarketcap.com/all/views/all/')
=end




=begin
filepath = "test.csv"

csv_options = {headers: :first_row, col_sep: ','}

CSV.open(filepath, 'wb', csv_options) do |csv|

  csv << ['title', 'index']

end
=end

#<div class="sc-1kxikfi-0 fjclfm cmc-table__column-name cmc-table__column-name--narrow-layout"><div><img src="https://s2.coinmarketcap.com/static/img/coins/32x32/1027.png" alt="Ethereum" width="16" height="16" class="cmc-static-icon cmc-static-icon-1027"><a href="/currencies/ethereum/" title="Ethereum" class="cmc-link">ETH</a></div><a href="/currencies/ethereum/" title="Ethereum" class="cmc-link">Ethereum</a></div>
#<td class="cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__name"
#><div class="sc-1kxikfi-0 fjclfm cmc-table__column-name cmc-table__column-name--narrow-layout"><div><img src="https://s2.coinmarketcap.com/static/img/coins/32x32/1027.png" alt="Ethereum" width="16" height="16" class="cmc-static-icon cmc-static-icon-1027"><a href="/currencies/ethereum/" title="Ethereum" class="cmc-link">ETH</a></div><a href="/currencies/ethereum/" title="Ethereum" class="cmc-link">Ethereum</a></div></td>