require File.dirname(__FILE__) + '/../spec_helper'

# define a migration
class CreateTasks < ActiveRecord::Migration
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

# run the migration
CreateTasks.migrate(:up)
