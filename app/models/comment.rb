class Comment < ApplicationRecord
  belongs_to :post, optional: true
	validates :commenter, presence: true
  validates :body, presence: true
end
