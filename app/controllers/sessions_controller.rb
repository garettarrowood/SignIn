class SessionsController < ApplicationController
  def new
  end

  def create
    set_session_data
    if session['github'][:token]
      redirect_to organizations_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private
  def set_session_data
    github_data = request.env['omniauth.auth']
    session['github'] = {
      :uid => github_data.uid,
      :username => github_data.info.nickname,
      :email => github_data.info.email,
      :token => github_data.credentials.token
    }
  end
end
