class DropPortfolios < ActiveRecord::Migration[6.0]
  
  def up
    drop_table :porfolios
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
