# frozen_string_literal: true

class CurrenciesController < ApplicationController
  def index
    outcome = ListCurrencies.run

    if outcome.valid?
      @currencies = outcome.result
    else
      @currencies = []
      flash.now[:notice] = outcome.errors.messages[:currencies].join(' ')
    end

  end

  def show
    outcome = FindCurrency.run(params)
    if outcome.valid?
      @currency = outcome.result
    else
      redirect_to root_path, alert: outcome.errors.messages[:currency].join(' ')
    end

  end

  def update_rates
    jid = UpdateRatesWorker.perform_async
    Rails.logger.info("UpdateRatesWorker started with jid = #{jid}")
    redirect_to root_path, notice: "Идет обновление курсов валют. Подождите"
  end
end
