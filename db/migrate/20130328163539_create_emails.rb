class CreateEmails < ActiveRecord::Migration
  def change
    create_table :outbound_emails do |t|
      t.column :sender, :string
      t.column :subject, :string
      t.column :'stripped-text', :string

      t.timestamps
    end
  
  end
end
