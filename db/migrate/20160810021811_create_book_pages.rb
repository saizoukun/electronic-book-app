class CreateBookPages < ActiveRecord::Migration
  def change
    create_table :book_pages do |t|
      t.belongs_to :book, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
