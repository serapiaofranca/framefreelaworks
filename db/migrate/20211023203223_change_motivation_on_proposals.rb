class ChangeMotivationOnProposals < ActiveRecord::Migration[6.1]
  def change
    change_column(:proposals, :motivation, :text)
  end
end
