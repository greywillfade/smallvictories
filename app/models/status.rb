class Status < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	validates :content, presence: true, length: {minimum: 2}
	validates :user_id, presence: true
	validates :category_id, presence: true
end
