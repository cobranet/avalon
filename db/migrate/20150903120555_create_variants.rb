class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.column :description, :string
      t.column :num_of_players, :integer
      t.column :oznake, :string
      t.timestamps
    end
  end
end
