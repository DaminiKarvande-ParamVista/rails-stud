class DropSolidQueueTables < ActiveRecord::Migration[8.0]
  def up
    # Drop Solid Queue tables in correct dependency order
    drop_table :solid_queue_blocked_jobs, if_exists: true
    drop_table :solid_queue_failed_jobs, if_exists: true
    drop_table :solid_queue_ready_executions, if_exists: true
    drop_table :solid_queue_scheduled_jobs, if_exists: true
    drop_table :solid_queue_pauses, if_exists: true
    drop_table :solid_queue_jobs, if_exists: true
    drop_table :solid_queue_processes, if_exists: true
    drop_table :solid_queue_executions, if_exists: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
