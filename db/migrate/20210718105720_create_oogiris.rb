class CreateOogiris < ActiveRecord::Migration[6.1]
  def change
    create_table :oogiris do |t|
      t.string :title
      t.string :oogiri
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
