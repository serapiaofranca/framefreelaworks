class ChangeEmploymentHistoryOnProfiles < ActiveRecord::Migration[6.1]
  def change
    change_column(:profiles, :employment_history, :text)
  end
end
