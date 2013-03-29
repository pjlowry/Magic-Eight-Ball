class RenameColumnToText < ActiveRecord::Migration
  def change
    rename_column :inbound_emails, :'stripped-text', :text
  end
end
