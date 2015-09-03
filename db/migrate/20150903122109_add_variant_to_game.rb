class AddVariantToGame < ActiveRecord::Migration
  def change
    add_column :games, :variant, :integer
  end
end
