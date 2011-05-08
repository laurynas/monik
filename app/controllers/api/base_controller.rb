class Api::BaseController < ApplicationController

  before_filter :check_auth

  protected

  def check_auth
    @listener = Listener.find(params[:listener_id])

    if @listener.token != params[:token]
      render :text => "Access denied. Check listener id and token.\n\n", :status => :unauthorized
      return false
    end
  end

end

