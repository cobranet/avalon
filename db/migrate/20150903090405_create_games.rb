class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.column :user_id, :integer
      t.column :roles, :string
      t.timestamps
    end
  end
end
