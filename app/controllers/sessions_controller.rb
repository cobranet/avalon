class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    u = :user_id.to_s.to_i
    g = Game.user_game(u)
    
    if g
      Game.find(g).leave_game(u)
    end  
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
