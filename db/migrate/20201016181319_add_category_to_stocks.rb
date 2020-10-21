class AddCategoryToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :category, :string
  end
end
