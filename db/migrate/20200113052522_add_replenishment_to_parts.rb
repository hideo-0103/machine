class AddReplenishmentToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :replenishment, :integer, null: false, default: 0
  end
end
