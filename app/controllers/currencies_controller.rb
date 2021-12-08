class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all
  end

  def show
    @currency = Currency.find_by(char_code: params[:char_code])
    @error_msg = 'not_found' unless @currency
  end

  def load
    Parser.xml_into_hash.each do |el|
      Currency.create(el)
    end
  end

  def update_rates
    Parser.xml_into_hash.each do |data_set|
      currency = Currency.find_by(num_code: data_set[:num_code])
      currency.update(value: data_set[:value])
    end
  end
end