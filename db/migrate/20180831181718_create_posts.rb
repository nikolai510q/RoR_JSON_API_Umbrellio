class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false, index: true
      t.string :header, null: false
      t.text :body, null: false
      t.inet :author_ip, null: false
      t.float :avr_rating, default: 0
      
    end
  end
end
