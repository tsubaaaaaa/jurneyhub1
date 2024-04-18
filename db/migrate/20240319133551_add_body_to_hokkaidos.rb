class AddBodyToHokkaidos < ActiveRecord::Migration[6.1]
  def change
    add_column :hokkaidos, :body, :text
  end
end
