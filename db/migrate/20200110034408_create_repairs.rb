class CreateRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :repairs do |t|
      t.string :title
      t.string :text
      t.references :machine, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
