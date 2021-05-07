class CreateEntry < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.string :name
      t.string :notes
      t.boolean :complete, default: false
      
      t.timestamps
    end
  end
end
