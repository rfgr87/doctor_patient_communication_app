require 'pry'

class DoctorsController < ApplicationController

  # get '/doctors' do
  #   @doctors = Doctor.all
  #   erb :'/doctors/index' 
  # end

  # get '/doctors/new' do
  #   erb :'/owners/new'
  # end

  get '/doctors/main' do
    erb :'doctors/main'
  end

  # post '/doctors/login' do
  #   @doctor = Doctor.find_by(params[:id])
  #   erb :"/doctors/#{@doctor.id}"
  # end

  get "/doctors/login" do 
    erb :'/doctors/login'
  end

  post '/doctors/login' do
    @doctor = Doctor.find_by(params[:id])
    if @doctor && @doctor.authenticate(params[:password])
      session[:doctor_id] = @doctor.id 
      erb :'/doctors/show'
    else
      erb :'/doctors/failure'
    end
  end


  post "/doctors/singup" do
    @doctor = Doctor.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if !@doctor.id.nil?
      redirect "/doctors/login"
    else
      redirect "/doctors/failure"
    end
  end

  get "/doctors/failure" do
    erb :'/doctors/failure'
  end

  get '/doctors/logout' do
    session.clear
    redirect to '/'
  end

  get '/doctor/:id' do 
    @doctor = Doctor.find(params[:id])
    erb :'/doctors/show'
  end

  get '/doctors/:id/edit' do 
    @doctor = Doctor.find(session[:doctor_id])
    erb :'/doctors/edit'
  end

  patch '/doctors/:id' do 
    @doctor = Doctor.find(params[:id])
    @doctor.update(params["doctor"])
    erb :'doctors/show'
  end
end
#Idea for login based on the sessios lab






#Code from User Lab to do with sessions
# post '/login' do
#   @user = User.find_by(username: params[:username])
#   if @user
#     session[:user_id] = @user.id 
#     redirect to '/account'
#   else
#     erb :error
#   end
# end

# get '/account' do
#   erb :account
# end


# #Other lab code

#   get "/signup" do
#     erb :signup
#   end

#   post "/signup" do
#     if params[:password] == "" || params[:username] == ""
#       redirect "/failure"
#     else
#       User.create(username: params[:username], password: params[:password])
#       redirect "/login"
#     end
#   end
  

#   get '/account' do
#     @user = User.find(session[:user_id])
#     erb :account
#   end


#   get "/login" do
#     erb :login
#   end

#   post "/login" do
#     user = User.find_by(username: params[:username])
 
#     if user && user.authenticate(params[:password])
#       session[:user_id] = user.id
#       redirect "/account"
#     else
#       redirect "/failure"
#     end
#   end

#   get "/failure" do
#     erb :failure
#   end

#   get "/logout" do
#     session.clear
#     redirect "/"
#   end

#   helpers do
#     def logged_in?
#       !!session[:user_id]
#     end

#     def current_user
#       User.find(session[:user_id])
#     end
#   end

# end
