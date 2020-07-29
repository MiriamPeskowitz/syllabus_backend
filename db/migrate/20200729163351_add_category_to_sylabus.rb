class AddCategoryToSylabus < ActiveRecord::Migration[6.0]
  def change
    add_reference :sylabuses, :category, foreign_key: true
  end
end
