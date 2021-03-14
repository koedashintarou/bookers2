class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
   belongs_to :user
   has_many :post_comments, dependent: :destroy
  validates :body,    length: { maximum: 200 } 
end
