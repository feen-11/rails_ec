# frozen_string_literal: true

class DropTasks < ActiveRecord::Migration[7.0]
  def up
    drop_table :tasks if ActiveRecord::Base.connection.table_exists? 'tasks'
  end

  def down
    return if ActiveRecord::Base.connection.table_exists? 'tasks'

    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.timestamps
    end
  end
end
