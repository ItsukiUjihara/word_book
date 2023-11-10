class RenameWordColumnToSynonyms < ActiveRecord::Migration[7.1]
  def change
    rename_column :synonyms, :word, :synonym_name
  end
end
