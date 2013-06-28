# -------------------------------------------------------------
# Create Postgre schema SAP
# -------------------------------------------------------------
class CreateSapSchema < ActiveRecord::Migration
  def up
    #transaction do
      execute "CREATE SCHEMA sap"
    #end
  end

  def down
    transaction do
      execute "DROP SCHEMA sap"
    end
  end
end