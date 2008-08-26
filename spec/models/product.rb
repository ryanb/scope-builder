class Product < ActiveRecord::Base
  named_scope :released, :conditions => ['released=?', true]
  belongs_to :category
end

class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.boolean :released
      t.integer :category_id
    end
  end
  
  def self.down
    drop_table :products
  end
end
