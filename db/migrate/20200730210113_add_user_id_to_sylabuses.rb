class AddUserIdToSylabuses < ActiveRecord::Migration[6.0]
  def change
    add_reference :sylabuses, :user, null: false, foreign_key: true
  end
end
