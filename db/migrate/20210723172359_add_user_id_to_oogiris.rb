class AddUserIdToOogiris < ActiveRecord::Migration[6.1]
  def change
    add_reference :oogiris, :user, foreign_key: true
  end
end
