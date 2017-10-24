class FixUserIdName < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients, :user_id, :item_id
  end
end
