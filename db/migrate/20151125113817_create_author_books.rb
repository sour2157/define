class CreateAuthorBooks < ActiveRecord::Migration
  def change
    create_table :author_books do |t|
      t.integer :book_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
