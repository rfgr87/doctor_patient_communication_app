class Patient < ActiveRecord::Base
    belongs_to :doctor
    has_many :medicins
    
    validates_presence_of :name, :username, :email, :password
  end