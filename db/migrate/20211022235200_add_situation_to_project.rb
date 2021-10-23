class AddSituationToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :situation, :integer, default: 3
  end
end
