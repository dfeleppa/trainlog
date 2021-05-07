class RemoveCompleteFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :complete, :boolean
  end
end
