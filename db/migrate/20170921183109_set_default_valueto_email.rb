# frozen_string_literal: true

class SetDefaultValuetoEmail < ActiveRecord::Migration[5.1]
  def change
    change_column_null :emails, :mailsend, true
  end
end
