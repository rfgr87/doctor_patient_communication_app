class PatientsController < ApplicationController

  get '/patients/main' do
    erb :'patients/main'
  end

  get "/patients/login" do 
    erb :'/patients/login'
  end


  post '/patients/login' do
    @patient = Patient.find_by(username: params[:username], email: params[:email])
    if @patient && @patient.authenticate(params[:password])
      session[:patient_id] = @patient.id 
      erb :'/patients/show'
    else
      erb :'/patients/failure'
    end
  end
  

  post "/patients/singup" do
    @patient = Patient.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if !@patient.id.nil?
      redirect "/patients/login"
    else
      redirect "/patients/failure"
    end
  end

  
  get "/patients/failure" do
    erb :'/patients/failure'
  end

  get '/patients/id' do 
    @patient = Patient.find(params[:id])
    erb :'/patients/show'
  end

  get '/patients/id/edit' do 
    @patient = Patient.find(session[:patient_id])
    @doctors = Doctor.all
    erb :'/patients/edit'
  end

  #Only doctor can edit patients
  #Using dynamic routs
  #Be more specific on RESTFULL routs
  #Be less wordy regarding double checks
  
  patch '/patients/id' do 
    @patient = Patient.find(session[:patient_id])
    @patient.update(params[:patient])
    @doctor = Doctor.find_by(name: params[:doctor_id])
    @patient.doctor = @doctor
    @patient.doctor_id = @doctor.id
    if @patient.doctor == @doctor
      @patient.save
      erb :'patients/show'
    else
      redirect :'patients/failure'
    end
  end

  get '/patients/logout' do
    session.clear
    redirect to '/'
  end
end