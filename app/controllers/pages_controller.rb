class PagesController < ApplicationController
  def home
  	@users = User.where(id: current_user.id)
  end
end
