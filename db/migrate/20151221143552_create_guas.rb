class CreateGuas < ActiveRecord::Migration
  def change
    create_table :guas do |t|
      t.string :name
      t.text :gtext, :explain
      t.integer :serial
      t.timestamps
    end
  end
end
