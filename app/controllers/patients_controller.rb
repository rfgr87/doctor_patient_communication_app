class PatientsController < ApplicationController

    get '/pets' do
      @pets = Pet.all
      erb :'/pets/index' 
    end
  
    get '/patients/new' do 
      @doctors = Doctors.all
      erb :'/patients/new'
    end
  
    post '/patients' do
        @patient = Patient.create(params[:pet])
        @patient.doctor = Doctor.find_by_id(params[:patient][:doctor_id])
        @doctor = @patient.doctor
        @doctor.save
        @patient.save
        redirect to "patients/#{@patient.id}"
    end	
  
  
    get '/patients/:id/edit' do 
      @patient = Patient.find(params[:id])
      @doctors = Doctor.all
      erb :'/patients/edit'
    end
    
    get '/patients/:id' do 
      @patient = Patient.find(params[:id])
      erb :'/patients/show'
    end
    
    patch '/patients/:id' do 
      if !params[:patient].keys.include?("doctor_id")
      params[:patient]["doctor_id"] = []
      end
      @patient = Patient.find(params[:id])
      @patient.update(params["patient"])
      if !params["doctor"]["name"].empty?
        @patient.doctor = Doctor.create(name: params["doctor"]["name"])
      end
      redirect "patients/#{@patient.id}"
    end
  end