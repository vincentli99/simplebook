class AddFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.text :opinion
      t.timestamps
    end
  end
end
