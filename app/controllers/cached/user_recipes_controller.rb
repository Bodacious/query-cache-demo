class Cached::UserRecipesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render template: "recipes/index", assigns: { user: user }
  end

  private

  def current_user
    User.find(current_user_id)
  end

  def current_user?
    !!current_user
  end
end
