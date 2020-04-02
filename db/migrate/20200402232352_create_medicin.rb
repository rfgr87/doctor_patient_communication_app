class CreateMedicin < ActiveRecord::Migration
  def change
    create_table :medicins do |t|
      t.string :name
      t.string :notes
      t.integer :patient_id
      t.integer :doctor_id
    end
  end
end
