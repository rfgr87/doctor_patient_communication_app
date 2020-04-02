class PatientsController < ApplicationController

  get '/patients/main' do
    erb :'patients/main'
  end

  post '/patients/login' do
    @patient = Patient.find_by(params[:id])
    erb :"/patients/#{@patient.id}"
  end

  post "/patients/singup" do
    @patient = Patient.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if !@patient.id.nil?
      redirect "/patients/login"
    else
      redirect "/patients/failure"
    end
  end

  get "/patients/login" do 
    erb :'/patients/login'
  end

  get "/patients/failure" do
    erb :'/patients/failure'
  end

  get '/patients/:id' do 
    @patient = Patient.find(params[:id])
    erb :'/patients/show'
  end

  get '/patients/:id/edit' do 
    @patient = Patient.find(params[:id])
    erb :'/patients/edit'
  end

  patch '/patients/:id' do 
    @patient = Patient.find(params[:id])
    @patient.update(params["patient"])
    @patient.doctor = Doctor.find_by(params["patient[doctor_id]"])
    redirect "patients/#{@patient.id}"
  end
end