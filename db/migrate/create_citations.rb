class CreateCitations < ActiveRecord::Migration
  def self.up 
    create_table :citation do |t|
      t.string :author
      t.string :title
      t.string :bibtex
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :citation
  end
end
