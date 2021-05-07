class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :data
      t.integer :entry_id
    end
  end
end
