class AddRepairsText < ActiveRecord::Migration[5.0]
  def change
    add_column :repairs, :text, :text,limit: 4294967295
  end
end
