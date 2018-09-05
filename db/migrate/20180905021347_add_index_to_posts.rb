class AddIndexToPosts < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, :avr_rating, order: {avr_rating: :desc}
  end
end
