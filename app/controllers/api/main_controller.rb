class Api::MainController < Api::BaseController

  def log
    @entry = @client.entries.create :content => params[:data].read

    render :text => "Monik: created entry ##{@entry.id}\n"
  end

end

