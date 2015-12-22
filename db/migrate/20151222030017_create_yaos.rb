class CreateYaos < ActiveRecord::Migration
  def change
    create_table :yaos do |t|
      t.string :name
      t.text :ytext
      t.text :explain
      t.integer :serial
      t.integer :gua_id
      t.boolean :yingyang
    end
    
    add_index :yaos, :gua_id
  end
end
