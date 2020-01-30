class AddPartToMachines < ActiveRecord::Migration[5.0]
  def change
    add_reference :machines, :part, foreign_key: true
  end
end
