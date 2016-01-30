class CreateReivews < ActiveRecord::Migration
  def change
    create_table :reivews do |t|
      t.text :comment
      t.integer :product_id
      t.interger :user_id

      t.timestamps null: false
    end
  end
end
