class AddMandatoryFieldstoEmail < ActiveRecord::Migration[5.1]
  def change
    change_column :emails, :mailto, :string, null: false
    change_column :emails, :mailbody, :string, null: false
  end
end
