class CreateEmails < ActiveRecord::Migration
  def change
    create_table :outbound_emails do |t|
      t.column :to, :string
      t.column :from, :string
      t.column :subject, :string
      t.column :text, :string
      t.column :inbound_email_id, :int

      t.timestamps
    end
  
  end
end
