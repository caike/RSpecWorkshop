class AddVegetarianToZombies < ActiveRecord::Migration
  def change
    add_column :zombies, :vegetarian, :boolean, default: false
  end
end
