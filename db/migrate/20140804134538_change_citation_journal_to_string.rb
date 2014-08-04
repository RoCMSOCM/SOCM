class ChangeCitationJournalToString < ActiveRecord::Migration
  def change
    change_column :citations, :journal, :string
  end
end
