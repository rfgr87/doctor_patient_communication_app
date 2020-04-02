class CreatePatients < ActiveRecord::Migration
  def change 
    create_table :patients do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :doctor_id
    end
  end
end
