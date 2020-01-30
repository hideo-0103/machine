class RemoveImageFromMachines < ActiveRecord::Migration[5.0]
  def change
    remove_column :machines, :image, :string
  end
end
