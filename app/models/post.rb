class Post < ApplicationRecord
  belongs_to :user, optional: true
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy  
  validates :user_id, presence: true
	validates :title, presence: true, length: { minimum: 3, message: 'Too short to post!' }
  validates :body, presence: true, length: { maximum: 4000, message: 'Too long !' }
end
