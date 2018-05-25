class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :tag
      t.text :text
      t.references :page, foreign_key: true
      t.timestamps
    end
    add_index :contents, :tag
  end
end
