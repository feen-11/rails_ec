class DropTasks < ActiveRecord::Migration[7.0.8]
  def up
    drop_table :tasks if ActiveRecord::Base.connection.table_exists? 'tasks'
  end
end