class AddNameToPins < ActiveRecord::Migration
  def change
    add_column :pins, :Name, :string
  end
end
