class RemovePartsFromMachines < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :machines, :parts
    remove_index :machines, :part_id
    remove_reference :machines, :part
  end
end
