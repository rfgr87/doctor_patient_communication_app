class Medicin < ActiveRecord::Base
    belongs_to :patient
    validates_presence_of :name, :notes
  end