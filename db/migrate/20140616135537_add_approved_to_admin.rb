class AddApprovedToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :approved, :boolean
    add_index  :admins, :approved
  end
end
