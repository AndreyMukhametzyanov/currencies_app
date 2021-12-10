class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all
  end

  def show
    @currency = Currency.find_by(char_code: params[:char_code])
  end

  def load
    Parser.xml_into_hash.each do |el|
      Currency.create(el)
    end
    redirect_to root_path
  end

  def update_rates
    Parser.xml_into_hash.each do |data_set|
      currency = Currency.find_by(num_code: data_set[:num_code])
      currency.update(value: data_set[:value])
    end
    redirect_to root_path
  end
end