class SessionsController < ApplicationController
  def destroy
    delete_stored_session_id!
    redirect_to root_url
  end
end
