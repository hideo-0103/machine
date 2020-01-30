class CreateUseParts < ActiveRecord::Migration[5.0]
  def change
    create_table :use_parts do |t|
      t.references :parts, foreign_key: true
      t.integer :quentity
      t.timestamps
    end
  end
end
