class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def arcsoft
    render html: "Ciao Jacopo, Mattia e Stefan!"
  end
end
