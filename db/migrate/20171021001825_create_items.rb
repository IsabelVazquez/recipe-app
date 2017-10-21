class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.string :measurement

      t.timestamps
    end
  end
end
