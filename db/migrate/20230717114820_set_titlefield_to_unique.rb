class SetTitlefieldToUnique < ActiveRecord::Migration[7.0]
  def change
    def up
      # Add a unique index
    add_index :books, :title, unique: true
  end
  def down
    # Remove the unique index
    remove_index :books, :title
  end
  end
end
