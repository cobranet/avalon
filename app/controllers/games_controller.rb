class GamesController < ApplicationController
  
  def index
    if current_user
      g = Game.user_game(current_user.id)
      if g
        redirect_to game_url(g)
      end
    end                    
  end

  def leave
    @game = Game.find_by_id(params[:id])
    @game.leave_game(current_user.id)
    redirect_to games_path
  end
  
  def show
    @game = Game.find_by_id(params[:id])
    if  @game == nil || Game.user_game(current_user.id) != @game.id
      redirect_to games_url
      return
    end
    
    @variant = Variant.find(@game.variant)
    if @game.status == 1
      @Iam = @game.my_role(current_user.id)
    end
  end 

  def list
    @opengames = Game.where(:status => 0).all
  end
  def kill
    @game = Game.find(params[:id])
    @game.kill_game
    redirect_to games_path
  end
  def open
    @game = Game.new
  end
  
  def join
    g = Game.find(params[:id])
    g.players.create(:user_id => current_user.id)
    redirect_to game_url(g)
  end

  def start
    g = Game.find(params[:id])
    g.start
    redirect_to game_url(g)
  end

  def restart
    g = Game.find(params[:id])
    g.restart
    redirect_to game_url(g)
  end
  
  def create
    
    v = Variant.where(description: params[:variant], num_of_players: params[:num_play]).first
    if v == nil
      raise params.inspect
    end  
    g = Game.create( :user_id => current_user.id, :variant => v.id, :status => 0)
    redirect_to game_url(g)
  end


  # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params[:game].permit(:name,:roles)
    end

end
