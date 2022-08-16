class ApplicationController < ActionController::Base

  helper_method :current_user, :current_user?, :memoized?

  private

  def memoized?
    self.class.name.start_with?("Memoized")
  end

  def ensure_current_user_id
    session[:current_user_id] = random_user_id
  end

  def random_user_id
    User.pluck(:id).sample
  end

  def current_user_id
    (session[:current_user_id] || params[:current_user_id] || ensure_current_user_id).to_i
  end
end
