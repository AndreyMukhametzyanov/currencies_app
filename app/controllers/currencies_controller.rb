# frozen_string_literal: true

class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all.order(:name)
  end

  def show
    @currency = Currency.find_by(char_code: params[:char_code])
  end

  def update_rates
    UpdateRatesWorker.perform_async
    redirect_to root_path, notice: "Идет обновление курсов валют. Подождите"
  end
end
