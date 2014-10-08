class CreateInboxHierarchies < ActiveRecord::Migration
  def change
    create_table :inbox_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false
      t.integer  :descendant_id, :null => false
      t.integer  :generations, :null => false
    end

    add_index :inbox_hierarchies, [:ancestor_id, :descendant_id, :generations],
              :unique => true, :name => "inbox_anc_desc_udx"

    add_index :inbox_hierarchies, [:descendant_id],
              :name => "inbox_desc_idx"
  end
end
