class Game < ActiveRecord::Base
  belongs_to :user
  has_many :players
  @@MINIONS = ["B","H","E","D"]
  def start
    self.status = 1
    self.players.create(:user_id => self.user_id)
    add_roles
    self.save!
  end
  
  def my_role(user_id)
    self.players.each do |p|
      if  p.user_id == user_id
        return p.role
      end
    end  
  end

  def kill_game
    self.status = 2
    self.save!
  end
  
  def self.user_game(user_id)
    Game.where("status = 1 or status = 0").to_a.each do |g|

      if g.user_id == user_id
        return g.id
      end
      
      if g.players.map { |x| x.user_id }.include?(user_id)
        return g.id
      end
    end
    return nil
  end
  
  def is_startable?
    return self.players.size == Variant.find(self.variant).num_of_players - 1 # all but owner
  end
  
  def who_is(role)
    arr = []
    self.players.each do |p|
      if role == p.role
        arr << p.user_id
      end
    end
    arr
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
