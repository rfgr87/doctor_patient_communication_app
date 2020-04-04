require 'pry'

class DoctorsController < ApplicationController

  get '/doctors/main' do
    erb :'doctors/main'
  end

  get '/doctors/login' do 
    erb :'/doctors/login'
  end



  post "/doctors/singup" do
    @doctor = Doctor.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if !@doctor.id.nil?
      erb :'/doctors/login'
    else
      redirect "/doctors/failure"
    end
  end

  post '/doctors/login' do
    @doctor = Doctor.find_by(username: params[:username], email: params[:email])
    if @doctor && @doctor.authenticate(params[:password])
      session[:doctor_id] = @doctor.id 
      erb :'/doctors/show'
    else
      erb :'/doctors/failure'
    end
  end

  get "/doctors/failure" do
    erb :'/doctors/failure'
  end

  get '/doctors/logout' do
    session.clear
    redirect to '/'
  end

  get '/doctors/id' do 
    @doctor = Doctor.find(session[:doctor_id])
    erb :'/doctors/show'
  end

  get '/doctors/id/edit' do 
    @doctor = Doctor.find(session[:doctor_id])
    erb :'/doctors/edit'
  end

  patch '/doctors/edit_patient' do 
    @patient = Patient.find_by(params[:patient_id])
    @medicin = Medicin.find_by(name: params[:medicin_name])
    if !@medicin.nil?
      @patient.medicins << @medicin
      @patient.save
    else
      @medicin = Medicin.create(name: params[:medicin_name], notes: params[:medicin_notes])
      @patient.medicins << @medicin
      @patient.save
    end
    erb :'doctors/updated_patient'
  end


  patch '/doctors/id' do 
    @doctor = Doctor.find(session[:doctor_id])
    @doctor.update(params[:doctor])
    erb :'doctors/show'
  end

  patch '/doctors/delete_medicins' do 
    @patient = Patient.find_by(params[:patient_id])
    @medicin = Medicin.find_by(params[:medicin_id])
    @medicin.destroy
    @patient.save
    erb :'doctors/updated_patient'
  end

  get '/doctors/select_patient' do 
    @doctor = Doctor.find(session[:doctor_id])
    @patients = @doctor.patients
    erb :'doctors/select_patient'
  end

  post '/doctors/edit_patient' do 
    @doctor = Doctor.find(session[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    erb :'doctors/edit_patient'
  end

end
