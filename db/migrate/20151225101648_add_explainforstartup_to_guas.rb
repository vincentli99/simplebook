class AddExplainforstartupToGuas < ActiveRecord::Migration
  def change
    add_column :guas, :explain2, :text
    add_column :yaos, :explain2, :text
  end
end
