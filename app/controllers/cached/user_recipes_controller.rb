class Cached::UserRecipesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render template: "recipes/index", assigns: { user: user }
  end

  private

  # Also defining here, for parity with memoized controller
  def current_user
    super
  end
end
