class Patient < ActiveRecord::Base
    has_secure_password

    belongs_to :doctor
    has_many :medicins
    
    validates_presence_of :name, :username, :email, :password_digest
  end