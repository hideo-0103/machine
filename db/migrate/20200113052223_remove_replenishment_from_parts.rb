class RemoveReplenishmentFromParts < ActiveRecord::Migration[5.0]
  def change
    remove_column :parts, :replenishment, :integer
  end
end
