class AddUniqIndexToCurrencies < ActiveRecord::Migration[6.1]
  def change
    add_index :currencies, :num_code, unique: true
    add_index :currencies, :char_code, unique: true
  end
end
