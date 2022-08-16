class Memoized::UserRecipesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render template: "recipes/index", assigns: { user: user }
  end

  private

  def current_user
    @current_user ||= super
  end
end
