class CreateOogiris < ActiveRecord::Migration[6.1]
  def change
    create_table :oogiris do |t|
      t.string :title, null: false
      t.string :oogiri, null: false
      t.string :description

      t.timestamps
    end
  end
end
