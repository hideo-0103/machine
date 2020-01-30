class ChangeReplenishmentOfParts < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :parts, :replenishment, :integer, null: false, default: 0
    end
    def down
      change_column :parts, :replenishment, :integer 
    end
  end
end
