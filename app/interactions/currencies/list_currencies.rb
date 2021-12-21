class ListCurrencies < ActiveInteraction::Base
  def execute
    currencies = Currency.all
    if currencies.any?
      currencies
    else
      errors.add(:currencies, "There is no currencies exists!")
    end
  end
end