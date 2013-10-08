# -------------------------------------------------------------
# Create postgres schema for sap models
# -------------------------------------------------------------
class CreateSapSchema < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute 'CREATE SCHEMA sap'
  end

  # down
  def down
    ActiveRecord::Base.connection.execute 'DROP SCHEMA sap'
  end
end
