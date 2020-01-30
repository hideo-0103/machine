class RemoveRepairsText < ActiveRecord::Migration[5.0]
  def change
    remove_column :repairs, :text, :string
  end
end
