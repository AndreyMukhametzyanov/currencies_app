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

  #
  # def update_rates
  #
  # end
end