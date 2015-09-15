class Game < ActiveRecord::Base
  belongs_to :user
  has_many :players
  @@MINIONS = ["B","H","E","D"]
  @@MERLIN_SEE = ["B","H","E","F"]
  @@MESSAGES = { "A" => "Bad gays are",
                 "B" => "We are the power",
                 "C" => "You know of Merlin",
                 "D" => "Merlin can't se you and We are the power",
                 "E" => "Percival can't tell diference and we are the power",
                 "F" => "You know nothing",
                 "G" => "You know nothing",
                 "H" => "We are the power",
                 "I" => "You know nothing",
                 "J" => "You know nothing",
                 "K" => "You know nothing",
                 "L" => "You know nothing",
                 "M" => "We are the power",
                 "N" => "We are the power" }
    
                 
  def start
    self.status = 1
    self.players.create(:user_id => self.user_id)
    add_roles
    self.save!
  end

  def restart
    self.status = 1
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
  def json_data(user_id)
    data = {}
    data['game_id'] = self.id
    data['players'] = []
    self.players.each do |p|
      u = User.find(p.user_id) 
      data['players'] << { 'user_name' => u.name, 'image' => u.image }
    end 
    data['game_status'] = self.status
    v = Variant.find(self.variant)
    data['variant'] = { 'desc' => v.description, 'oznake' => v.oznake }
    if self.status == 1
      role = self.my_role(user_id)
      data['you_are'] = role
      data['message'] = @@MESSAGES[role]
    end 
    data.to_json
  end
  def leave_game(user_id)
    self.players.each do |player|
      if user_id == player.user_id
        player.delete
        player.save!
      end
    end
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
  def is_restartable?
    return self.players.size == Variant.find(self.variant).num_of_players  # all 
  end

  def reveal_to(role)
    #Merlin 
    if role == "A"
      return @@MINIONS.append("F")
    end  
  end
  
  def who_is(role)
    arr = []
    self.players.each do |p|
      if role == p.role
        arr << p.user_id
      end
    end
    arr[0]
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

  def merlin_see
    arr = []
    self.players.each do |p|
      if @@MERLIN_SEE.include?(p.role) 
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
      if players[index] 
        self.players[index].role = oznaka
        self.players[index].save!
      end 
    end
  end
  
end
