class DropHokkaidotagrelations < ActiveRecord::Migration[6.1]
    def change
      drop_table :hokkaido_tag_relations do |t|
        t.references :hokkaido, null: false, foreign_key: true
        t.references :tag, null: false, foreign_key: true
        t.timestamps
      end
  end
end
