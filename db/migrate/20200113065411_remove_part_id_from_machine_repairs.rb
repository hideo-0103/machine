class RemovePartIdFromMachineRepairs < ActiveRecord::Migration[5.0]
  def change
    remove_reference :machines_repairs, :part, foreign_key: true
  end
end
