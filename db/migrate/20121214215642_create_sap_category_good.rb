# -------------------------------------------------------------
# Many-to-many relationship:
#            __Sap::CategoryGood__
#           |                     |
#          good_id           category_id
#           |                     |
#   Sap::Good                   Sap::Category
# -------------------------------------------------------------
class CreateSapCategoryGood < ActiveRecord::Migration
  def change
    create_table :"sap.category_good" do |t|
      t.integer :category_id
      t.integer :good_id
    end
  end
end