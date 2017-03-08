class AddLikescountToBooks < ActiveRecord::Migration
  def change
    add_column :books, :likes_count, :integer
  end
end
