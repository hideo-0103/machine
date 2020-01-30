class CreateRecordsPdfs < ActiveRecord::Migration[5.0]
  def change
    create_table :records_pdfs do |t|

      t.timestamps
    end
  end
end
