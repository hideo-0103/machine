class ChangeQuentityOfParts < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :parts, :quentity,  :integer, null: false, default: 0
    end
    def down
      change_column :parts, :quentity, :integer 
    end
  end
end
