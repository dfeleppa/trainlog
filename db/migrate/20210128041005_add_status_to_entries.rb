class AddStatusToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :status, :string
  end
end
