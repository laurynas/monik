class Api::MainController < Api::BaseController

  def log
    @entry = @client.entries.create :content => params[:data].read

    render :text => "Created entry ##{@entry.id}\n"
  end

end

