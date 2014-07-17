class UpdateCitations < ActiveRecord::Migration
  def change
    remove_column :citations, :url, :string
    add_column :citations, :journal, :string, :null => :false
    add_column :citations, :year, :integer, :null => :false
    add_column :citations, :volume, :integer
    add_column :citations, :number, :integer
    add_column :citations, :pages, :integer
    add_column :citations, :month, :string
    add_column :citations, :note, :string
    add_column :citations, :key, :string
  end
end
