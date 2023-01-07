class AddForeignKeyToArticle < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :articles, :users
  end
end
