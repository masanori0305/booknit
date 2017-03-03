class AddNicknameToBooks < ActiveRecord::Migration
  def change
    add_column :books, :nickname, :string
  end
end
