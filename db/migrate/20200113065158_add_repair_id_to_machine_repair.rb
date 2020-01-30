class AddRepairIdToMachineRepair < ActiveRecord::Migration[5.0]
  def change
    add_reference :machines_repairs, :repair, foreign_key: true
  end
end
