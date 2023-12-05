class DropTasks < ActiveRecord::Migration[7.0]
  def change
      drop_table :tasks if ActiveRecord::Base.connection.table_exists? 'tasks'
    end
  end
end
