class AddColumnsToAds < ActiveRecord::Migration
  def change
    add_column :ads, :type, :string
    add_column  :ads, :from, :string
    add_column :ads, :to, :string
  end
  def self.down
    remove_column :ads, :from
    remove_column :ads, :to
  end
end
