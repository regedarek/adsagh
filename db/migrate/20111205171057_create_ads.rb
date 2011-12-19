class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :name
      t.string :phone_number
      t.string :email
      t.integer :email_id
      t.text :ad_content
      t.string :token
      t.date :verification_date
      t.integer :category_id
      t.integer :admin_id
      t.decimal :price, :precision => 6, :scale => 2 
      t.integer :display_counter, :default => 0

      t.timestamps
    end
  end
end
