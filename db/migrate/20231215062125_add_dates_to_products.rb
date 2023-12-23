class AddDatesToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :dates, :date
  end
end
