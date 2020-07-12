class CreateUsers < ActiveRecord::Migration[5.2]
  # usersテーブルとname email password_digestカラムを定義している
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
