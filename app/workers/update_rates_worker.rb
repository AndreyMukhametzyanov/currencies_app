class UpdateRatesWorker
  include Sidekiq::Worker

  def perform
    sleep(5)
    Parser.xml_into_hash.each do |data_set|
      currency = Currency.find_by(num_code: data_set[:num_code])
      currency.update(value: data_set[:value])
    end
  end
end
