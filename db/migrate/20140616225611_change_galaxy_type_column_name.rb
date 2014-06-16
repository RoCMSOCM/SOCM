# column name :type is a reserved word in ActiveRecord.
# so this migration renames the field
class ChangeGalaxyTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :galaxies, :type, :galaxy_type
  end
end
