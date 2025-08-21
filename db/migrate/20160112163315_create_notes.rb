class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.string :content
      t.references :song, foreign_key: true
      t.timestamps null: false
    end
  end
end
