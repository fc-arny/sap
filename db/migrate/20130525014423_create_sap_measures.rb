class CreateSapMeasures < ActiveRecord::Migration
  def up
    create_table :'sap.measures' do |t|
      t.integer :id
      t.string  :name, null: false
      t.integer :step, null: false
      t.integer :value_in_parent
      t.integer :parent_id
    end

    add_foreign_key :'sap.measures', :'sap.measures', column: :parent_id
    add_foreign_key :'sap.goods', :'sap.measures', column: :measure_id

    Sap::Measure.create :id => 1, :name => 'gram', :step => 100
    Sap::Measure.create :id => 2, :name => 'kilo', :step => 1, :value_in_parent => 1000, :parent_id => 1
    Sap::Measure.create :id => 3, :name => 'piece', :step => 1
  end

  def down
    drop_table :'sap.measures'
  end
end
