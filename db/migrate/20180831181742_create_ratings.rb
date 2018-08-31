class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :post_id, null: false
      t.integer :value, null: false
    end
  end
end
