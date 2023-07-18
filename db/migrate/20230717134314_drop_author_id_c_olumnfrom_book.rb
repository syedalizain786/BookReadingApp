class DropAuthorIdCOlumnfromBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :author_id

  end
end
