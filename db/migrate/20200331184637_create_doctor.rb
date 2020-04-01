class CreateDoctor < ActiveRecord::Migration
  def change
    create_table :doctor do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
    end
  end
end
