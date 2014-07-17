class AlterCitations < ActiveRecord::Migration
  def change
    add_column :citations, :author, :string
    add_column :citations, :title, :string
    add_column :citations, :bibtex, :string
    add_column :citations, :url, :string
  end
end
