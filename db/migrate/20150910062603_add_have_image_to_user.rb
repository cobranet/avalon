class AddHaveImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :haveimage, :integer
  end
end
