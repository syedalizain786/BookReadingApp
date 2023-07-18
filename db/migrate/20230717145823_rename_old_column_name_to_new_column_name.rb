class RenameOldColumnNameToNewColumnName < ActiveRecord::Migration[7.0]
    def change
      rename_column :books, :authors_id, :author_id
    end
end
