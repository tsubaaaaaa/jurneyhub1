class AddImageToHokkaidos < ActiveRecord::Migration[6.1]
  def change
    add_column :hokkaidos, :image, :string
  end
end
