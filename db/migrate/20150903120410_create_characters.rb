class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.column :oznaka, :string
      t.column :name, :string
      t.column :image, :string
      t.timestamps
    end
  end
end
