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
  
  
    get '/pets/:id/edit' do 
      @pet = Pet.find(params[:id])
      @owners = Owner.all
      erb :'/pets/edit'
    end
    
    get '/pets/:id' do 
      @pet = Pet.find(params[:id])
      erb :'/pets/show'
    end
    
    patch '/pets/:id' do 
      if !params[:pet].keys.include?("owner_id")
      params[:pet]["owner_id"] = []
      end
      @pet = Pet.find(params[:id])
      @pet.update(params["pet"])
      if !params["owner"]["name"].empty?
        @pet.owner = Owner.create(name: params["owner"]["name"])
      end
      redirect "pets/#{@pet.id}"
    end
  end