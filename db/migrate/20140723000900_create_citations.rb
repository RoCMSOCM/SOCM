class CreateCitations < ActiveRecord::Migration
  def up
    create_table :citations do |t|
      t.text :author, :limit => nil
      t.string :title
      t.text :bibtex, :limit => nil
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
    change_column :citations, :author, :text, :null => false
    change_column :citations, :bibtex, :text, :null => false
    change_column :citations, :journal, :string, :null => false
    change_column :citations, :year, :integer, :null => false
  end
  def down
    drop_table :citations
  end
end
