class Api::MainController < Api::BaseController

  def log
    @entry = @listener.entries.create :content => params[:message]

    render :text => "Monik: created entry ##{@entry.id}\n"
  end

end

