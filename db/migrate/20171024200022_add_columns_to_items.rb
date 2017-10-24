class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :measurement, :string
    add_column :items, :quantity, :integer
  end
end
