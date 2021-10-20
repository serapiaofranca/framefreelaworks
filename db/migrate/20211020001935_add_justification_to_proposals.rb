class AddJustificationToProposals < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :justification, :text, default: 'none'
  end
end
