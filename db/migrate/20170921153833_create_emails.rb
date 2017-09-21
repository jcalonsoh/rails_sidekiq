class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :mailto
      t.text :mailbody
      t.binary :mailsend

      t.timestamps
    end
  end
end
