class RemoveUserIdColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :user_id, :string
  end
end
