require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :'main_page/welcome'
  end

  helpers do
    def doctor_logged_in?
      !!session[:doctor_id]
    end

    def patient_logged_in?
      !!session[:patient_id]
    end

    def doctor_current_user
      Doctor.find(session[:doctor_id])
    end

    def patient_current_user
      Patient.find(session[:patient_id])
    end

  end

end


