class CreateGalaxyCitations < ActiveRecord::Migration
  def self.up
    create_table 'galaxy_citations', :id => false do |t|
      t.column :galaxy_id, integer
      t.colum :citation_id, integer
    end
  end
  def self.down
    drop_table 'galaxy_citations'
  end
end
