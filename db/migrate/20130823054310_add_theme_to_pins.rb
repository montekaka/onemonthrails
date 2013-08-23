class AddThemeToPins < ActiveRecord::Migration
  def change
    add_column :pins, :theme, :string
  end
end
