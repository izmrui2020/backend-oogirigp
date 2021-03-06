class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, index: true
      t.string :nickname
      t.string :email, unique: true

      t.timestamps
    end
  end
end
