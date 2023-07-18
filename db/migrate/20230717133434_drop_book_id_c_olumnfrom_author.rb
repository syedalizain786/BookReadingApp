class DropBookIdCOlumnfromAuthor < ActiveRecord::Migration[7.0]
  def change
      remove_column :authors, :book_id
  end
end
