class CreateMedicin < ActiveRecord::Migration
  def change
    create_table :medicin do |t|
      t.string :medicins
      t.string :notes
    end
  end
end
