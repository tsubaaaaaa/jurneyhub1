class AddUserIdToHokkaidos < ActiveRecord::Migration[6.1]
  def change
    add_column :hokkaidos, :user_id, :integer
  end
end
