class CreateHokkaidos < ActiveRecord::Migration[6.1]
  def change
    create_table :hokkaidos do |t|
      t.string :title
      t.string :name

      t.timestamps
    end
  end
end
