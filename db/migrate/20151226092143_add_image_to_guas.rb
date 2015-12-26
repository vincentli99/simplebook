class AddImageToGuas < ActiveRecord::Migration
  def change
    add_column :guas, :image, :string
  end
end
