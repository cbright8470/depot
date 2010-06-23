class AddPriceToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :price, :decimal,
                :scale=> 2, :precision=> 8, :default=> 0
  end

  def self.down
    remove_column :products, :price
  end
end
