class Api::BaseController < ApplicationController

  before_filter :check_auth

  protected

  def check_auth
    @client = Client.find(params[:client_id])

    if @client.token != params[:token]
      render :text => "Access denied. Check client id and token.\n\n", :status => :unauthorized
      return false
    end
  end

end

