class Comment < ActiveRecord::Base
  belongs_to :book               #tweetsテーブルとのアソシエーション
  belongs_to :user                #usersテーブルとのアソシエーション
end
