class Agent < ApplicationRecord
	validates :name, presence: true, length: { minimum: 5 }
	validates :image, presence: true

	enum status: { enabled:  1 , disabled:  2 }


	def image_size
    errors[:image] << "should be less than 1MB" if image.size > 1.megabytes
  end
end
