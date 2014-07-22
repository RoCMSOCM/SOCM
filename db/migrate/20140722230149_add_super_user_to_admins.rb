class AddSuperUserToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :super_user, :boolean
  end
end
