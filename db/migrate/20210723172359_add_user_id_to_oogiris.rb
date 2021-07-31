class AddUserIdToOogiris < ActiveRecord::Migration[6.1]
  def change
    add_reference :oogiris, :user, :created_at, foreign_key: true, null: false
  end
end
