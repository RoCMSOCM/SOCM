class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.string :author
      t.string :title
      t.text :bibtex
      t.string :journal
      t.integer :year
      t.integer :volume
      t.integer :number
      t.integer :pages
      t.string :month
      t.string :note
      t.string :key

      t.timestamps
    end
    change_column :citations, :author, :string, :null => false
    change_column :citations, :title, :string, :null => false
    change_column :citations, :bibtex, :text, :null => false
    change_column :citations, :journal, :string, :null => false
    change_column :citations, :year, :integer, :null => false
  end
end
