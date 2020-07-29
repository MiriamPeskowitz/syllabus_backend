class RemoveCategoryIdFromSylabuses < ActiveRecord::Migration[6.0]
  def change
    remove_column :sylabuses, :category_id, :integer
  end
end
