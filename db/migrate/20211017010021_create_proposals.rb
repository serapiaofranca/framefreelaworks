class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.string :motivation
      t.decimal :hourly_rate
      t.integer :weekly_available_hours
      t.date :expected_completion
      t.references :project, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
