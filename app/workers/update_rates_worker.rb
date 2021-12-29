# frozen_string_literal: true

class UpdateRatesWorker
  include Sidekiq::Worker

  def perform(*_args)
    UpdateRates.run
  end
end
