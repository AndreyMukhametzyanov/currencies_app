# frozen_string_literal: true

class UpdateRates < ActiveInteraction::Base
  object :logger

  def execute
    logger.info 'Update currencies job started '
    CbrParser.xml_into_hash.each do |data_set|
      currency = Currency.find_by(num_code: data_set[:num_code])
      currency.update(value: data_set[:value])
    end
    logger.info 'Currencies updating is finished'
  end
end
