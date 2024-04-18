class RemoveAddressFromHokkaidos < ActiveRecord::Migration[6.1]
  def change
    remove_column :hokkaidos, :address, :string
  end
end
