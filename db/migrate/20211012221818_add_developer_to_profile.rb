class AddDeveloperToProfile < ActiveRecord::Migration[6.1]
  def change
    add_reference :profiles, :developer, null: false, foreign_key: true
  end
end
