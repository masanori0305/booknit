class RenameAutherColumnToBooks < ActiveRecord::Migration
  def change
    rename_column :books, :auther, :author
    rename_column :books, :ganre, :publisher
  end
end
