class Pin < ActiveRecord::Base
	attr_accessible :description, :image, :image_remote_url, :theme, :Name

	validates :description, :presence => true
	validates :user_id, :presence => true	
	has_attached_file :image, styles: { medium: "320x240"}
	#has_attached_file :image
	# this is for paperclip 3.0
	validates_attachment :image, :presence => true,
															 :content_type => {:content_type=>['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
															 :size => { :less_than => 5.megabytes}

	#this is for paperclip 2.7
	# validates_attachment_presence :image
	# validates_attachment_presence :true
	# validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
	# validates_attachment_size :image, :less_than => 5.megabytes

	belongs_to :user

	def image_remote_url=(url_value)
		self.image = URI.parse(url_value) unless url_value.blank?
		super
	end
end
