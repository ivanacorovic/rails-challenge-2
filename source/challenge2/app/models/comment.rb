class Comment < ActiveRecord::Base
	belongs_to :story
	validates :story_id, presence: true
	belongs_to :user
	validates :user_id, presence: true
end
