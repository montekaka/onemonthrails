class AddYearToPins < ActiveRecord::Migration
  def change
    add_column :pins, :year, :int
  end
end
