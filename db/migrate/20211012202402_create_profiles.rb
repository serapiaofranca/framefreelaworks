class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :social_name
      t.date :birth_date
      t.string :education
      t.string :skills
      t.string :employment_history
      t.string :avatar

      t.timestamps
    end
  end
end
