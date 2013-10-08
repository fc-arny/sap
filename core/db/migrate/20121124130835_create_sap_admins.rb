# -------------------------------------------------------------
# SAP's administrator table
# -------------------------------------------------------------
class CreateSapAdmins < ActiveRecord::Migration
  def change
    create_table :'sap.admins', comment: 'Admin users' do |t|
      t.string :fist_name, null:false,   comment: 'Admin name'
      t.string :last_name, null:false,   comment: 'Admin surname'
      t.string :email, null:false,  comment: 'Every admin user must have email'
    end

    # Indexes

  end
end
