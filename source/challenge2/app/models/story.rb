class Story < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	has_many :comments
	default_scope -> { order('created_at DESC') }
end
