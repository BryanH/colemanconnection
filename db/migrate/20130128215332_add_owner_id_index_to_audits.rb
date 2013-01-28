class AddOwnerIdIndexToAudits < ActiveRecord::Migration
  def change
    add_index :audits, [:owner_id, :owner_type]
  end
end
