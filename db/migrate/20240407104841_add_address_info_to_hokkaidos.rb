class AddAddressInfoToHokkaidos < ActiveRecord::Migration[6.1]
  def change
    add_column :hokkaidos, :address, :string
    add_column :hokkaidos, :latitude, :float
    add_column :hokkaidos, :longitude, :float
  end
end
