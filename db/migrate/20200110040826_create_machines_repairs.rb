class CreateMachinesRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :machines_repairs do |t|

      t.references :machine, foreign_key: true
      t.references :part, foreign_key: true
      t.timestamps
    end
  end
end
