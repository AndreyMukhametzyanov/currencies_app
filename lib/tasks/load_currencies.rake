# frozen_string_literal: true

desc 'Получение данных с сайта https://www.cbr.ru/scripts/XML_daily.asp'
task load_currencies: :environment do
  CbrParser.xml_into_hash.each { |el| Currency.create(el) }
end
