class UpdateCurrencies < ActiveInteraction::Base
  def execute
    jid = UpdateRatesWorker.perform_async(5)
    Rails.logger.info("UpdateRatesWorker started with jid = #{jid}")
  end
end