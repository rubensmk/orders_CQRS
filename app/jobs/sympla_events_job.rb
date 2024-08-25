class SymplaEventsJob < ApplicationJob
  def perform
    doc = Nokogiri::HTML(URI.open('https://www.sympla.com.br/eventos?cl=4-congressos-e-palestras&page=1'))

    doc.css('.EventCardstyle__EventInfo-sc-1rkzctc-5.hRaRCu').each do |element|
      date_text = element.children[0].text
      title_text = element.children[1].text
      location_text = element.children[2].text

      event = {
        location: location_text,
        name: title_text,
        date: handle_start_date_formatting(date_text)
      }

      Event.create!(event)
    end
  end

  private

  def handle_start_date_formatting(date_text)
    dates = date_text.scan(/\d{2} \w{3}/)

    DateTime.parse("#{dates[0]} 2024")
  end
end
