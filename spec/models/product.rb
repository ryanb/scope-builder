class Product < ActiveRecord::Base
  named_scope :released, :conditions => ['released=?', true]
end

class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.boolean :released
    end
  end
  
  def self.down
    drop_table :products
  end
end
