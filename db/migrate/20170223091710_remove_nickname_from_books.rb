class RemoveNicknameFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :nickname
  end
end
