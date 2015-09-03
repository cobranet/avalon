class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.column :game_id, :integer
      t.column :user_id, :integer
      t.column :role, :integer
      t.timestamps
    end
  end
end
