class Game < ActiveRecord::Base
  belongs_to :user
  has_many :players
  @@MINIONS = ["B","H"]
  def start
    self.status = 1
    self.players.create(:user_id => self.user_id)
    add_roles
    self.save!
  end
  def minions
    arr = []
    self.players.each do |p|
      if @@MINIONS.include?(p.role) 
          arr << p.user_id
      end
    end
    arr
  end
  def add_roles
    variant = Variant.find(self.variant)
    arr = []
    (0..variant.oznake.size-1).each do |x|
      arr << variant.oznake[x]
    end
    arr.shuffle.each_with_index do |oznaka,index|
      self.players[index].role = oznaka
      self.players[index].save!
    end
  end
  
end
