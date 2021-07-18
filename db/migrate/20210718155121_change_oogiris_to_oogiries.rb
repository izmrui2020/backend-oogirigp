class ChangeOogirisToOogiries < ActiveRecord::Migration[6.1]
  def change
    rename_table :oogiris, :oogiries
  end
end
