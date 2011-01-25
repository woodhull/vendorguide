class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :vendor_id
      t.integer :user_id
      t.text    :description
      t.integer :score
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
