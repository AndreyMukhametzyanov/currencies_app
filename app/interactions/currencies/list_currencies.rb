class ListCurrencies < ActiveInteraction::Base
  def execute
    currencies = Currency.all

    if currencies.any?
      currencies.order(:name)
    else
      errors.add(:currencies, "There is no currencies exists!")
    end
  end
end