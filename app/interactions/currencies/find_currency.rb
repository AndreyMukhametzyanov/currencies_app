class FindCurrency < ActiveInteraction::Base
  string :char_code
  def execute
    currency = Currency.find_by_char_code(char_code)
    if currency
      currency
    else
      errors.add(:currency, "Currency with char_code = #{char_code} is not found!")
    end
  end
end