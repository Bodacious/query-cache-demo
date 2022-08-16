class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user?, :memoized?

  private

  def memoized?
    self.class.name.start_with?("Memoized")
  end

  def random_user_id
    User.pluck(:id).sample
  end

  def current_user_id
    (params[:current_user_id] || random_user_id).to_i
  end

  def current_user
    User.find(current_user_id)
  end

  def current_user?
    !!current_user
  end
end
