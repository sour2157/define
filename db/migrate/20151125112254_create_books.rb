class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.attachment :cover

      t.timestamps null: false
    end
  end
end
