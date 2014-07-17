class ChangeCitationBibtexToText < ActiveRecord::Migration
  def change
    change_column :citations, :bibtex, :text
  end
end
