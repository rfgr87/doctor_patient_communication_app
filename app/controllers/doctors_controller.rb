require 'pry'

class DoctorsController < ApplicationController

  get '/doctors' do
    @doctors = Doctor.all
    erb :'/doctors/index' 
  end

  get '/doctors/new' do
    erb :'/owners/new'
  end

  post '/doctors' do 
    @doctor = Doctor.create(params[:doctor])
    redirect "/doctors/#{@doctor.id}"
  end

  get '/doctors/:id/edit' do 
    @doctor = Doctor.find(params[:id])
    erb :'/owners/edit'
  end

  get '/doctors/:id' do 
    @doctor = Doctor.find(params[:id])
    erb :'/doctors/show'
  end

  patch '/doctors/:id' do 
    @doctor = Doctor.find(params[:id])
    @doctor.update(params["doctor"])
    redirect "doctors/#{@doctor.id}"
  end
end