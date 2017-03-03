class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text        :title
      t.text        :auther
      t.text        :ganre
      t.text        :review

      t.timestamps
    end
  end
end
