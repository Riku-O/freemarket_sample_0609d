class RenameColumnItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :postage_burden, :post_burden_id
  end
end
