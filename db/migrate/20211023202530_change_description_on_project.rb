class ChangeDescriptionOnProject < ActiveRecord::Migration[6.1]
  def change
    change_column(:projects, :description, :text)
  end
end
