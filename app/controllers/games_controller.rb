class GamesController < ApplicationController
  
  def index
    @opengames = Game.where(:status => 0).all
  end

  def show
    @game=Game.find(params[:id])
    @variant = Variant.find(@game.variant)
    if @game.status == 2
      @Iam = @game.my_role(current_user.id)
    end
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

  def new
    g = Game.create( :user_id => current_user.id, :variant => params[:variant], :status => 0)
    redirect_to game_url(g)
  end
end
