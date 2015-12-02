class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :photoable, polymorphic: true

      t.timestamps null: false
    end
  end
end
