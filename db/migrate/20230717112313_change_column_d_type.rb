class ChangeColumnDType < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :pubdate, :date, using: 'pubdate::date'
  end
end
