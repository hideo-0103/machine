class ChangeDataTextToRepairs < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :repairs, :text, :text,limit: 4294967295
    end
    def down
      change_column :repairs, :text, :string 
    end
  end
end
