class CreateMedicin < ActiveRecord::Migration
  def change
    create_table :medicins do |t|
      t.string :name
      t.string :notes
    end
  end
end
