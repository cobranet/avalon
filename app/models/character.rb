class Character < ActiveRecord::Base
  def self.get(oznaka)
    Character.where(:oznaka => oznaka).first
  end
end
