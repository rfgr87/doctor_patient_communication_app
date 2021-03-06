class Doctor < ActiveRecord::Base
  has_secure_password
  
  has_many :patients
  has_many :medicins, through: :patients
   
  validates_presence_of :name, :username, :email, :password_digest
  end