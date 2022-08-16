class RecipesController < ApplicationController
  def cached
    render :index, assigns: { user: User.find(params[:user_id]) }
  end

  def memoized
    render :index, assigns: { user: User.find(params[:user_id]) }
  end
end
