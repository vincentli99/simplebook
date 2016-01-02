class AddImginfoToGuas < ActiveRecord::Migration
  def change
    add_column :guas, :image_source, :string
  end
end
