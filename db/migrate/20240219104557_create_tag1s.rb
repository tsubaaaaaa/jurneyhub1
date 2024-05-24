class CreateTag1s < ActiveRecord::Migration[6.1]
  def change
    create_table :tag1s do |t|
      t.string :tag1_name

      t.timestamps
    end
  end
end
