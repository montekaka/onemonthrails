class AddModelNumberToPins < ActiveRecord::Migration
  def change
    add_column :pins, :modelnumber, :string
  end
end
