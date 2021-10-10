class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :requirements
      t.decimal :hourly_rate
      t.date :expiration_date
      t.boolean :require_presential_meetings

      t.timestamps
    end
  end
end
