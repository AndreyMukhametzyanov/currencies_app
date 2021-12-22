class UpdateRatesWorker
  include Sidekiq::Worker

  def perform(*args)
    UpdateRates.run
  end
end
