class DropRatyrateTables < ActiveRecord::Migration
  def up
    drop_table :average_caches
    drop_table :rates
    drop_table :rating_caches
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
