class ChangeCoachIdToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :coach_id, :integer)
  end
end
