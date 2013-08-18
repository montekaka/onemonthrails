class AddAttachmentImageToPin < ActiveRecord::Migration
  def self.up
    add_column :pins, :image_file_name, :string
    add_column :pins, :image_content_type, :string
    add_column :pins, :image_file_size, :integer
    add_column :pins, :image_updated_at, :datetime
  end

  def self.down
    remove_column :pins, :image_file_name
    remove_column :pins, :image_content_type
    remove_column :pins, :image_file_size
    remove_column :pins, :image_updated_at
  end
end
