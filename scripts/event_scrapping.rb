require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open('https://www.sympla.com.br/eventos?cl=4-congressos-e-palestras&page=1'))

doc.css('.EventCardstyle__EventInfo-sc-1rkzctc-5.hRaRCu').each do |element|
  date_text = element.children[0].text
  title_text = element.children[1].text
  location_text = element.children[2].text

  event_info = {
    location: location_text,
    title: title_text,
    date: date_text
  }

  p event_info
end
