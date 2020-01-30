class CreatePartsRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :parts_repairs do |t|
      t.references :part, foreign_key: true
      t.references :repair, foreign_key: true
      t.timestamps
    end
  end
end
