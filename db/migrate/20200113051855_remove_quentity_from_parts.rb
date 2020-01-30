class RemoveQuentityFromParts < ActiveRecord::Migration[5.0]
  def change
    remove_column :parts, :quentity, :integer
  end
end
