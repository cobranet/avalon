class ChangeRoleToSTring < ActiveRecord::Migration
  def change
    remove_column :players, :role
    add_column :players, :role, :string
  end
end
